# Resources usage on the system

In this chapter we will be looking at most common issues when it comes down to the usage of resources on the system.

Things such as High CPU load, High RAM usage, low Disk space left on the system.

## The **htop** command

**htop** and **top** are one of the most common commands when it comes to looking into how many resources the proccesses on the system are using.

`htop`{{execute}} will open a interactive program which gives us information about running programs, CPU and Memory usage, the PID, the time since it started etc.

You can press `F6` to sort by other fields like CPU, Memory etc. 

By default it will show us the highest consuming programs on the system at the top.

You can press `F10` or `q` after you noticed that a program is using too much memory or CPU.

Any kind of high activity might either be related to a high usage of the application, in which case it should be disscussed with the team to increase resources and scale up the application, add more servers.

Or in case of a new release, there might be some kind of leakage of resources and the development teams should be notified that the applications are using way too many resources.

## The **uptime** or **w** command

You can use `uptime`{{execute}} or `w`{{uptime}} to get a **load average** of the CPU being used on the system.

The 3 numbers shown in the **load average** section, represent how much **CPU** has been used of the total number of cores on the system, in the last 1, 5 and 15 minutes.

For example if we run: `nproc`{{execute}} we will get a number which represents the number of CPU cores which the system has.

If the numbers shown in the **load average** are higher than the number shown by `nproc`, it means that the applications on the system require more resources than what it has.

If the number of **load average** is constant, users will experience slowness because the applications don't have enough CPU resources to serve web pages to the users.

In either cases, if the **load average** is too high, we should either scale up the resources of the server or discuss with the development teams if that is expected.

## The **free** command

`free` will give us information about the memory usage on the system.

Running `free -h`{{execute}} will give us RAM usage in a human readable format/GB size.

It is usually useful to run as a first command when checking if there is a low memory usage on the system.

## Using the **ps** command

We can also use the **ps** command to easily get the programs which use the most CPU and memory.

We can run `ps` like so: `ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem`{{execute}}

This will give us all the proccesses on the system, and only show the Memory and CPU usage used by the programs.

## Using the **df** and **du** commands

When it comes down to checking disk usage on the system, `df` and `du` are the most common commands used.

`df` is used to check disk usage per filesystem/disk.
`du` is used to check disk usage per folders or files.