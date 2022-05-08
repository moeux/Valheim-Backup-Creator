# Valheim-Backup-Creator
Simple and verbose shell script to create backups of your Valheim game world.

## How to use?
1. Set the `worldsDir` variable to the directory containing your game world.
2. Set the `backupDir` variable to the directory you want to store your backups in.
3. **(Optional)** Set the `file` variable to change the name of your backup files.
4. **(Optional)** Set the `maxBackups` variable to choose how many backups you want to have at most.

That's it!
The script is pretty verbose so it will tell you if a directory couldn't be found or which files it's going to delete due to the maximum amounts of backups ([Step 4](https://github.com/moeux/Valheim-Backup-Creator/blob/main/README.md#how-to-use)) reached.
