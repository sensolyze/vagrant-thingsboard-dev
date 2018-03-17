# create link
#

$SHAREDPATH = "${env:VAGRANT_KITCHEN_ROOT}\shared_files"
echo $SHAREDPATH

# create links
if (!(Test-Path -Path ".\shared_files")) {
     cmd /c mklink /j shared_files $SHAREDPATH
     echo "Link for shared_files generiert"
} else {
     echo "shared_files existiert bereits"
}
 