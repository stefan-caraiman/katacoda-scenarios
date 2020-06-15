# Files and packages

## Working with files

From a files perspective we will most of the times open and modify files on the system.

Files such as configuration, scripts or log files.

Some common commands when working with files are:

  - `cat` command, to show us the contents of a file, for example if we want to see what's inside the `/etc/os-release` we can run: `cat /etc/os-release`{{execute}} this will give us information about the installed OS version
  - `less` command used to more easily Scroll Up and Down in a file, its similar to `cat`, you press `Q` to exit after you've finished reading the file, example: `less /etc/os-release`{{execute}}
  - `ls` used to list all files in a directory, most commonly used with the `-lah` arguments like so: `ls -lah`{{execute}} will list all files, directories and their size
  - `touch` used to create empty files, if we want to create a `somefile`, we can run: `touch somefile`{{execute}}
  - `mkdir` used to create empty directories, example: `mkdir somedirectory`{{execute}}
  - `cd` used to go/change directory to another one, example: `cd somedirectory`{{execute}} or if we want to go back to the previous folder we can run: `cd ..`{{execute}}
  - `rm` used to remove files or directories, example of deleting a file: `rm somefile`{{execute}} and deleting a directory requires you to run `rm` with the `-rf` argument like so: `rm -rf somedirectory`{{execute}}
  - `vim` or `nano` used to edit files, in `vim` you press ESC and then `:wq` to exit a file