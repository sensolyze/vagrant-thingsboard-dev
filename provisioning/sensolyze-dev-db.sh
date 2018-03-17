#!/bin/bash

SQLCMDUSER=SA
SQLCMDPASSWD='Admin!Password'

# Datenbank Backup Source: Release Environment

# Restore Conextrade databases
##############################
# restore cxt_cxtdb database
# /vagrant/files/apps/mssql/script/restore_db.sh $SQLCMDUSER $SQLCMDPASSWD cxt_cxtdb
# restore cxt_logError database
# /vagrant/files/apps/mssql/script/restore_db.sh $SQLCMDUSER $SQLCMDPASSWD cxt_logError
# restore cxt_messageBox database
# /vagrant/files/apps/mssql/script/restore_db.sh $SQLCMDUSER $SQLCMDPASSWD cxt_messageBox
# restore cxt_monitoring database
# /vagrant/files/apps/mssql/script/restore_db.sh $SQLCMDUSER $SQLCMDPASSWD cxt_monitoring
# restore cxt_transaction database
# /vagrant/files/apps/mssql/script/restore_db.sh $SQLCMDUSER $SQLCMDPASSWD cxt_transaction

# Restore Microsoft databases
#############################
# restore ms_reportServer database
# /vagrant/files/apps/mssql/script/restore_db.sh $SQLCMDUSER $SQLCMDPASSWD ms_reportServer
# /vagrant/files/apps/mssql/script/restore_db.sh $SQLCMDUSER $SQLCMDPASSWD ms_reportServerTempDB

# Restore nTerra databases
##########################
# restore nterra_iSell database
# /vagrant/files/apps/mssql/script/restore_db.sh $SQLCMDUSER $SQLCMDPASSWD nterra_isell

# Restore Software AG databases
###############################
# restore wm_ActiveTransfer database
# /vagrant/files/apps/mssql/script/restore_db.sh $SQLCMDUSER $SQLCMDPASSWD wm_ActiveTransfer
# restore wm_tn database
# /vagrant/files/apps/mssql/script/restore_db.sh $SQLCMDUSER $SQLCMDPASSWD wm_tn
