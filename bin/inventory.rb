#!/usr/bin/env ruby

# Gracefully borrowed from:
# http://tech.taskrabbit.com/blog/2015/03/12/ansible-dynamic-static-inventory/

require 'json'

class InventoryParser

  def initialize(inventory_path)
    @inventory_path = inventory_path
    @data = {
      "_meta" => {
        "hostvars" => {}
      }
    }
  end

  def inventory_path
    @inventory_path
  end

  def data
    @data
  end

  def ignored_variables
    [
      'ansible_ssh_user'
    ]
  end

  def file_lines
    File.read( inventory_path ).split("\n")
  end

  def parse
    current_section = nil

    file_lines.each do |line|
      parts = line.split(' ')
      next if parts.length == 0
      next if parts.first[0] == "#"
      next if parts.first[0] == "/"
      if parts.first[0] == '['
        current_section = parts.first.gsub('[','').gsub(']','')
        if data[current_section].nil? && !current_section.include?(':vars')
          data[current_section] = []
        end
        next
      end

      # varaible block
      if !current_section.nil? && current_section.include?(':vars')
        parts = line.split('=')
        key   = parts[0]
        value = parts[1]
        col   = current_section.split(':')
        col.pop
        group = col.join(':')
        fill_hosts_with_group_var(group, key, value)
      # host block (could still have in-line variables)
      else
        hostname = parts.shift
        ensure_host_variables(hostname)
        d = {}

        while parts.length > 0
          part = parts.shift
          words = part.split('=')
          d[words.first] = words.last unless ignored_variables.include? words.first
        end

        data[current_section].push(hostname) if current_section
        d.each do |k,v|
          data["_meta"]["hostvars"][hostname][k] = v
        end

      end
    end

    return data
  end

  def ensure_host_variables(hostname)
    if data["_meta"]["hostvars"][hostname].nil?
      data["_meta"]["hostvars"][hostname] = {}
    end
  end

  def fill_hosts_with_group_var(group, key, value)
    return if ignored_variables.include? key

    if value.include?("'") || value.include?('"')
      value = eval(value)
    end

    data[group].each do |hostname|
      ensure_host_variables(hostname)
      data["_meta"]["hostvars"][hostname][key] = value
    end
  end

end

path = File.expand_path File.dirname(__FILE__) + '/../ansible/vagrant/inventories/inventory'
data = InventoryParser.new(path).parse

puts JSON.pretty_generate( data )
