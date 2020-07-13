# Log files

In a Linux distribution you will find the generated log files in the `/var/log` folder.

You can see all the logs in the folder by running: `ls -la /var/log`{{execute}}

A **log file** contains information about all the events/actions that happened on a system. Such events can be:

  - When someone logged in on the operating system and what happens on the system(also called **syslog** or **system logs**)
    - On Ubuntu/Debian this file is `cat /var/log/syslog`{{execute}}
    - On Centos/Redhat this file is `cat /var/log/messages`{{execute}}
  - Who SSH-ed or accessed our website/Nginx web server
  - Logs about the application, if something failed inside the application
  - What the users on the system are doing, who used **sudo**:
    - On Ubuntu/Debian this file is `cat /var/log/auth.log`{{execute}}
    - On CentOS/Redhat this file is `cat /var/log/secure`{{execute}}

## Most common commands when working with a **log file** are:

  - `cat` to show the contents of a file
  - `vim` to see and edit a file
  - `grep` to search for text in a file/files
  - `wc` to count words/lines(for example we want to find out how many times a user or IP appears)
  - `sort` to sort alphabetically all the lines of a file
  - `uniq` to remove duplicate lines
  - `tail` to see the last lines of a file(by default you will get the last 10 lines of a file)
  - `less` to scroll up and down in a file


## Examples of looking for things in log files

1. Seeing what `sudo` commands were executed on the system: `cat /var/log/auth.log | grep -i command`{{execute}}
  
  - We `cat /var/log/auth.log` to get the contents inside the file
  - Then we use **|** (pipe) and search with **grep** for any text which contains the **command** word inside of it. The **-i** argument tells grep

2. Finding all the **.log** files inside `/var/log` using the `find` command: `find /var/log/ -iname "*.log"`{{execute}}

3. Search for what things the system downloaded: `cat /var/log/syslog | grep "Download`{{execute}}

4. Seeing logs about who and what accessed on the Nginx: `cat /var/log/nginx/access.log`{{execute}} 

5. Counting how many times an IP appeared in a Nginx log: `cat /var/log/nginx/access.log | grep "127.0.0.1" | wc -l`{{execute}}

  - We use `grep` and give it the "127.0.0.1" IP to search
  - Then we use `wc -l` to count how many times the IP appears

6. Seeing the last lines in the `syslog`: `tail /var/log/syslog`{{execute}}

7. Scrolling a files using the **arrow keys**/up and down by using the `less` command: `less /var/log/auth.log`{{execute}} you can then press `Esc` or `q` or `Ctrl C` to exit.

## Conclusion

We now know in what folder to look for log files, and we know some common commands to search for text/information in log files.

In most cases we will search for things such as **Error**, **IPs**, **Failure** inside files like this, or simply investigate what happened on the system.