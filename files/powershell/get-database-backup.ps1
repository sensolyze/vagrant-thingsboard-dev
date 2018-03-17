# get database backup
#

$DBSOURCE="release"
$VERSION="20170418"
echo "DBSOURCE = $DBSOURCE"
echo "VERSION  = $VERSION"

$ARTIFACTORYAPITOKEN = "${env:VAGRANT_ARTIFACTORY_APITOKEN}"
$ARTIFACTORYURL = "${env:VAGRANT_REPO_URL}"
echo "ARTIFACTORYAPITOKEN = $ARTIFACTORYAPITOKEN"
echo "ARTIFACTORYURL      = $ARTIFACTORYURL"

# change to backup directory
Push-Location -Path "../apps/mssql/backup/"
echo "Location changed to backup directory"

# get cxt_cxtdb.bak
#$BAKNAME="cxt_cxtdb.bak"
#if (Test-Path $BAKNAME) {
#  echo "Datenbank Backup $BAKNAME exists"
#} else {
#  echo "Download Datenbank Backup $BAKNAME"
#  curl -H "X-JFrog-Art-Api: $ARTIFACTORYAPITOKEN" -O "${ARTIFACTORYURL}/artifactory/database-epr-dev/$DBSOURCE/$VERSION/$BAKNAME"
#}

# get cxt_logError.bak
#$BAKNAME="cxt_logError.bak"
#if (Test-Path $BAKNAME) {
#  echo "Datenbank Backup $BAKNAME exists"
#} else {
#  echo "Download Datenbank Backup $BAKNAME"
#  curl -H "X-JFrog-Art-Api: $ARTIFACTORYAPITOKEN" -O "${ARTIFACTORYURL}/artifactory/database-epr-dev/$DBSOURCE/$VERSION/$BAKNAME"
#}

# get cxt_messageBox.bak
#$BAKNAME="cxt_messageBox.bak"
#if (Test-Path $BAKNAME) {
#  echo "Datenbank Backup $BAKNAME exists"
#} else {
#  echo "Download Datenbank Backup $BAKNAME"
#  curl -H "X-JFrog-Art-Api: $ARTIFACTORYAPITOKEN" -O "${ARTIFACTORYURL}/artifactory/database-epr-dev/$DBSOURCE/$VERSION/$BAKNAME"
#}

# get cxt_monitoring.bak
#$BAKNAME="cxt_monitoring.bak"
#if (Test-Path $BAKNAME) {
#  echo "Datenbank Backup $BAKNAME exists"
#} else {
#  echo "Download Datenbank Backup $BAKNAME"
#  curl -H "X-JFrog-Art-Api: $ARTIFACTORYAPITOKEN" -O "${ARTIFACTORYURL}/artifactory/database-epr-dev/$DBSOURCE/$VERSION/$BAKNAME"
#}

# get cxt_transaction.bak
#$BAKNAME="cxt_transaction.bak"
#if (Test-Path $BAKNAME) {
#  echo "Datenbank Backup $BAKNAME exists"
#} else {
#  echo "Download Datenbank Backup $BAKNAME"
#  curl -H "X-JFrog-Art-Api: $ARTIFACTORYAPITOKEN" -O "${ARTIFACTORYURL}/artifactory/database-epr-dev/$DBSOURCE/$VERSION/$BAKNAME"
#}

# get ms_reportServer.bak
#$BAKNAME="ms_reportServer.bak"
#if (Test-Path $BAKNAME) {
#  echo "Datenbank Backup $BAKNAME exists"
#} else {
#  echo "Download Datenbank Backup $BAKNAME"
#  curl -H "X-JFrog-Art-Api: $ARTIFACTORYAPITOKEN" -O "${ARTIFACTORYURL}/artifactory/database-epr-dev/$DBSOURCE/$VERSION/$BAKNAME"
#}

# get ms_reportServerTempDB.bak
#$BAKNAME="ms_reportServerTempDB.bak"
#if (Test-Path $BAKNAME) {
#  echo "Datenbank Backup $BAKNAME exists"
#} else {
#  echo "Download Datenbank Backup $BAKNAME"
#  curl -H "X-JFrog-Art-Api: $ARTIFACTORYAPITOKEN" -O "${ARTIFACTORYURL}/artifactory/database-epr-dev/$DBSOURCE/$VERSION/$BAKNAME"
#}

# get nterra_isell
#$BAKNAME="nterra_isell"
#if (Test-Path $BAKNAME) {
#  echo "Datenbank Backup $BAKNAME exists"
#} else {
#  echo "Download Datenbank Backup $BAKNAME"
#  curl -H "X-JFrog-Art-Api: $ARTIFACTORYAPITOKEN" -O "${ARTIFACTORYURL}/artifactory/database-epr-dev/$DBSOURCE/$VERSION/$BAKNAME"
#}

# get wm_tn
#$BAKNAME="wm_tn"
#if (Test-Path $BAKNAME) {
#  echo "Datenbank Backup $BAKNAME exists"
#} else {
#  echo "Download Datenbank Backup $BAKNAME"
#  curl -H "X-JFrog-Art-Api: $ARTIFACTORYAPITOKEN" -O "${ARTIFACTORYURL}/artifactory/database-epr-dev/$DBSOURCE/$VERSION/$BAKNAME"
#}

# go back to original location
Pop-Location
