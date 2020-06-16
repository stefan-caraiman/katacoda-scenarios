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
  - `pwd` to see in what folder we are currently in: `pwd`{{execute}}
  - `vim` or `nano` used to edit files, in `vim` you press ESC and then `:wq` to exit a file
  - `find` used to find files with certain name or extension, for example if we want to find all the files that have the `.log` termination in the `/var/log` folder we can run: `find /var/log -iname "*.log"`{{execute}}

Most of the times when working with a Linux distribution we will create, remove, edit, read and find files. The commands above help us achieve most of these actions.


## Working with packages

On Debian/Ubuntu the package manager is `apt`. The `package manager` is the tool which helps us install, uninstall, update and upgrade programs/packages and the overall things which we have on our system.

Most common commands when working with `apt` are:

  - `sudo apt update`{{execute}} used to fetch latest packages, it does **NOT** actually update any packages
  - `sudo apt upgrade`{{execute}} used to upgrade the version of packages, based on the latest packages fetched by **apt update**
  - `sudo apt list --installed`{{execute}} to list all of the installed packages/programs on the system. We can combine it with `grep` to search for certain packages like so: `apt list --installed | grep nginx`{{execute}}
  - `sudo apt install package-name` used to install packages/programs. In order to install a certain version of a package we can just add the equals sign at the end and specify the version, like so: ` sudo apt install tree=1.7.0-5`{{execute}}
  - `sudo apt remove package-name` used to remove a program, it will *NOT* delete configuration files
  - `sudo apt purge package-name` used to remove a program *and* the configuration files
  - `sudo apt autoremove`{{execute}} used to delete packages which are not being used anymore/garbage


