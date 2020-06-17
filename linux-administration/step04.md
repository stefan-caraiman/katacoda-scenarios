## Working with files

From a files perspective we will most of the times open and modify files on the system.

These files can be configuration, scripts or log files.


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
  - `which` and `whereis` used to find the **full path** on the system for where a program/command is, for example to find where the `cat` command is we can run: `which cat`{{execute}} or `whereis cat`{{execute}} . `whereis` will also tells us where documentation pages are.
  - `man` and `whatis` are used to find out information about commands, unlike `man`, `whatis` gives us only a short description like so: `whatis cat`{{execute}}

Most of the times when working with a Linux distribution we will create, remove, edit, read and find files. The commands above help us achieve most of these actions.

## Working with `echo`, `>` and `>>`.

The `echo` command is used to output a message to the terminal like so: `echo "Hello there!"`{{execute}}

We can use `echo` with the `>` and `>>` special signs.

`>` is a redirect of output/text to a file.

For example we can tell echo to put some text in a file like so: `echo "Some text" > file.txt`{{execute}} and if we check the file we can see it has the message "Some text", `cat file.txt`{{execute}}

`>` is used as an easy way to write text into a file, without opening and editing the file by hand. It is usually used in scripts.

**Beware** If you use `>` on an existing file, it will delete all the text inside, and only put your message in it. It overwrites everything inside the file.

So if we do `echo "Some other text" > file.txt`{{execute}} and then `cat` `cat file.txt`{{execute}} we notice that the file only contains `Some other text`.

`>>` is used to add extra content to the end of the file. Unlike `>` it will not overwrite/delete the contents inside an existing file.

For example `echo "another line" >> file.txt`{{execute}} and `cat file.txt`{{execute}} -> we notice the file also contains our new line.

Adding text to the end of a file is also called **appending**. So **>>** can be used to append **text** to files.

## Finding information in files

It's very common for us to try and find certain data in files. For example we search for a word in a file, want to check how many times it appears and so on.

Most common commands when working with finding/searching for text in files are:

  - `grep` used to search for text in a file/multiple files
  - `uniq` used to remove duplicate text/lines in a file
  - `sort` used to sort lines in a file by alphabetical order
  - `wc` used to count lines/words in a file

We have an `example.txt` log file which is similar to information we find in logs, `cat example.txt`{{execute}}

Some common(more advanced examples) on how to find information inside files:

**How to find how many times the word "BLOCKED" appears in a file:**

`cat example.txt | grep BLOCKED | wc -l`{{execute}}

The **|** is called a **pipe** in Linux scripting. It is used to **chain**/run commands one after another so that we can process data inside.

1. First, we output the text inside `example.txt` with `cat example.txt`.
2. Then we use **|**(**pipe**) to tell it to `grep BLOCKED` so that we can find only the lines in the file which contain the word **BLOCKED**
3. Then we **pipe** again to count how many times the word appears by using the command `wc -l`.

**How to find all the unique lines of text in a file and sort them:**

`cat example.txt | uniq | sort`{{execute}}

We `cat` to get the text inside the file and the use **pipe** twice to first get all the unique lines of text with the **uniq** command and then we run **sort** to get the lines in the alphabetical order.


Most of the times we will use these commands to find blocked,allowed IPs, malicious requests, find out if an IP is inside a file etc.


## Working with packages

On Debian/Ubuntu the package manager is `apt`. The `package manager` is the tool which helps us install, uninstall, update and upgrade programs/packages and the overall things which we have on our system.

**Most common commands when working with `apt` are:**

  - `sudo apt update`{{execute}} used to fetch latest packages, it does **NOT** actually update any packages
  - `sudo apt upgrade`{{execute}} used to upgrade the version of packages, based on the latest packages fetched by **apt update**
  - `sudo apt list --installed`{{execute}} to list all of the installed packages/programs on the system. We can combine it with `grep` to search for certain packages like so: `apt list --installed | grep nginx`{{execute}}
  - `sudo apt install package-name` used to install packages/programs. In order to install a certain version of a package we can just add the equals sign at the end and specify the version, like so: ` sudo apt install tree=1.7.0-5`{{execute}}
  - `sudo apt remove package-name` used to remove a program, it will *NOT* delete configuration files
  - `sudo apt purge package-name` used to remove a program *AND* the configuration files
  - `sudo apt autoremove`{{execute}} used to delete packages which are not being used anymore/garbage


## Conclusion

We now know how to manage files and packages on the system, most of the **lifetime** in a Linux system is mainly spent on working with files and modifying them, so many of these commands will be used daily.

