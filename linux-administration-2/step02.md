# Scripting

On most days when working with a Linux system we will simply run commands and look or edit files.

But there will be times when we need to write scripts to automate our workflow.


## Bash scripts

The most common kind of scripts in Linux are **bash scripts**.

**Bash** is both a scripting language and a shell(also called **interpretor** or **terminal**).

In a **shell** we can run commands and see their result/output.

Things to remember when working with any kind of scripting language:

  - each line in a script is executed one by one, sequentially
  - a script starts executing each line from the top/beggining of the file to the end/bottom and then stops
  - the first line in a bash script will be a **shebang**, it looks like this: **#!/bin/bash**
  - Because of the **shebang**, the **shell** knows that it needs to use **bash** to execute/run the script
  - A **bash script** filename ends with **.sh**


## Common actions in bash scripts

1. Write a **for** loop and `echo` each file that ends with `.sh`:

```
for file in $(ls *.sh); do
  echo $file
done
```

2. 

## Common bash scripts in interviews

In most interviews we will have to implement scripts that do:

1. Loop through numbers from 1 to 10 and echo if a number is even or odd(**un for loop care ne zice daca un numar este par sau impar, un numar este par daca se imparte la 2, altfel este impar**)

```
for number in $(seq 1 10); do
    # Verificam daca numarul se imparte la 2
    if (( $number % 2 )); then
      echo "$number este par";
    # Daca nu se imparte la 2 inseamna ca este impar
    else
      echo "$number este impar";
    fi
done
```


## Exercises:

1. 