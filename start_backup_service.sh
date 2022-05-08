#!/bin/sh

# ---- Valheim Backup Creator -----
#	  written by moeux

#		--- Settings ---
# The 'worlds' directory, containing the game world of your valheim server.
worldsDir=/home/moeux/valheim/worlds
# The backups directory to store and maintain backups in.
backupDir=/home/moeux/valheim/backups
# The generated name of the backup file | default: (day-month-year-hours:minutes:seconds).tar.gz.
file=$(date +"%d-%m-%Y-%T").tar.gz
# The max amount of backups to be stored.
maxBackups=10

#		--- Directory Checks ---
if [ ! -d "${worldsDir}" ]; then
  echo "Failed: Couldn't find 'worlds' directory to backup."
  exit 1
else
  echo "Found 'worlds' directory in ${worldsDir}."
fi

if [ ! -d "${backupDir}" ]; then
  echo "Couldn't find backups directory, creating backups directory in ${backupDir}."
  mkdir ${backupDir}
else
  echo "Found backups directory in ${backupDir}."
fi

#		--- Backup ---
echo "Creating backup with name ${file} in ${backupDir}."
tar czvf ${backupDir}/${file} ${worldsDir}

#		--- Cleanup ---
backupsAmount=$(ls ${backupDir} | wc -l)

if [ "${backupsAmount}" -gt "${maxBackups}" ]; then
  deletedFiles=$(ls -1t ${backupDir} | tail -n +$((${maxBackups}+1)))
  echo "More than ${maxBackups} backups found (${backupsAmount} backups), cleaning up."
  echo "Deleting following file(s):"
  echo "${deletedFiles}"
  cd ${backupDir}
  echo "${deletedFiles}" | xargs -d '\n' rm
else
  echo "Max backups amount (${maxBackups}) not exceeded (${backupsAmount} backups), nothing to clean up."
fi

echo "Currently stored $(ls $backupDir | wc -l) backups."
echo "Exiting."

