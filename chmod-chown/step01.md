# User, groups, chown, chmod

In acest capitol vom invata cum sa:

  - facem users
  - facem groups si sa adaugam users in groups
  - cum sa setam permisii pe fisiere
  - cum sa setam owners pe fisiere

## Cum putea crea un user in Linux

Ca sa cream un user in Linux rulam comanda `useradd` astfel: `useradd -m stefan -p parola`{{execute}}

Aceasta comanda ne va crea user-ul cu numele `stefan`, ii va crea un folder numit `/home/stefan` si ii va seta parola `parola`.

Putem valida ca user-ul a fost creat, uitandune la fisierul `cat /etc/passwd`{{execute}}

Vom observa ca la sfarsitul fisierului avem definitia unui nou user cu numele `stefan`.

De asemenea putem valida ca acest user are propriul lui folder, rulam comanda `ls -la /home/`{{execute}} si observam ca avem un director cu numele userului, dedicat lui.

Vom mai crea inca un user `adrian` pentru a fi folosit in tutorial, `useradd -m adrian -p parola`{{execute}}

## Cum putem sa ne schimbam catre un alt user in Linux?

Rulam comanda `su stefan`{{execute}} care ne va schimba user-ul in `stefan`.

Daca rulam comanda `whoami`{{execute}} ne va zice ca ce user suntem logged in, in acel moment, ar trebui sa ne zica ca suntem `stefan`.

Odata ce am terminat de rulat comenzi ca si acest user, putem rula comanda `exit`{{execute}}

Dupa ce am dat `exit`, daca rulam din nou comanda `whoami`{{execute}} ar trebui sa vedem ca suntem din nou user-ul default `root`.

## Cum putem reseta parola unui user?

In caz ca uitam parola unui user, folosim comanda `passwd`. 

`passwd stefan`{{execute}} ne va da un prompt sa setam o noua parola.


## Cum putea un group in Linux?

Un group in Linux reprezinta o multime de users pusi sub aceleasi reguli dictate de group.

De exemplu putem crea un group pentru `devops` cu comanda: `groupadd devops`{{execute}}

Si alt group cu numele `testers` cu comanda: `groupadd testers`{{execute}}.

Ca sa vedem ce `groups` exista, putem rula comanda: `cat /etc/group`{{execute}}

Ca sa adaugam un user `stefan` intr-un group `devops`, rulam comanda `usermod` astfel: `usermod -aG devops stefan`{{execute}}

Daca rulam din nou comanda `cat /etc/group`{{execute}} vom observa pe linia `devops` ca avem user-ul `stefan` adaugat la sfarsit.

Vom adauga si user-ul `adrian` in groupul de `testers`: `usermod -aG testers adrian`{{execute}}

## Cum putem seta owner-ul in Linux?

Un fisier contine informatii despre cine este `ownerul` la nivel de user si group, si cine are permisii sa il citeasca, modifice sau sa il ruleze/execute.

`owner`-ul reprezinta `user` si `group` care au voie sa schimbe in orice mod permisiile unui fisier.

De exemplu, vom crea un nou fisier in `/home` folder-ul userului `stefan`: `echo "Hello there" > /home/stefan/fisier.sh`{{execute}}

Daca rulam comanda `ls -l /home/stefan/`{{execute}} observam ca fisierul `fisier.sh` are owner-ul setat ca si `root` si `root`, deoarece am creat acest fisier ca si `root` in momentul de fata.

Prima colona care contine `root` reprezinta `user`-ul care detine acel fisier.
A doua coloana care contine `root` reprezinta `group`-ul de users care detin acel fisier.

Astfel, un fisier va avea mereu asociat un `user` si `group` de users.

Ca sa schimbam `owners` de `user` si `group` catre `stefan` si groupul de `devops` vom rula comanda `chown` astfel: `chown stefan:devops /home/stefan/fisier.sh`{{execute}}


Daca rulam comanda `ls -l /home/stefan/`{{execute}} observam ca fisierul `fisier.sh` are owner-ul setat ca si `stefan` si `devops`.

Asta inseamna ca user-ul `stefan` si oricine este in groupul `devops` poate modifica permisiile fisierului.

## Cum putem seta permisii de citire/scriere/executare in linux?

Permisiile in Linux dicteaza cine si cum poate citi, scrie sau execute un fisier.

Ca sa putem seta permisii, trebuie ori sa fim `root` ori `user` care sa fie `owner`, ori parte din `group` de owners.


Vom incerca sa schimbam permisiile ca si user-ul `stefan`.

1. Facem switch catre user-ul `stefan`: `su stefan`{{execute}}
2. Facem `cd` in folder-ul lui: `cd /home/stefan/`{{execute}}
3. Validam ca avem fiser-ul: `ls -l`{{execute}} si ca suntem user-ul `stefan` cu comanda `whoami`{{execute}}


In prima parte la output-ul comenzii `ls -l`, observam ca fisierul `fisier.sh` are setate permisiile: `-rw-r--r--`

Permisiile sunt setate astfel:

  - `r` inseamna drept de citire/read
  - `w` inseamna drept de scriere/write
  - `x` inseamna drept de executare/rulare de script

### Cum setam permisii la nivel de `user`

De exemplu daca vrem sa setam drept de citire, scriere si execute doar pentru user-ul nostru vom rula: `chmod u+rwx fisier.sh`{{execute}}


Daca rulam din nou `ls -l`{{execute}} observam ca avem acum setate permisiile `-rwxr--r--`, primele 4 litere reprezinta drepturile setate la nivel de `user`, de asta am scris comanda `chmod` incepand cu `u+`

### Cum setam permisii la nivel de `group`

Daca vrem sa setam drept de citire, scriere si execute la nivel de `group` vom scrie: `chmod g+rwx fisier.sh`{{execute}}


Daca rulam din nou `ls -l`{{execute}} observam ca avem acum setate permisiile `-rwxrwxr--`, urmatoarele 3 litere reprezentand drepturile setata la nivel de `group`

### Cum setam permisii pentru oricine altcineva de pe sistem

Daca vrem sa permitem sau nu oricarui alt user drepturi asupra unui fisier, rulam comanda `chmod` incepand cu litera `o`.

Daca vrem sa scoatem orice fel de drepturi pentru alti users de pe sistem rulam comanda: `chmod o-rwx fisier.sh`{{execute}}.


**Important:** litera minus va scoate drepturi, litera plus adauga drepturi in `chmod`.


Daca rulam din nou `ls -l`{{execute}} observam ca avem acum setate permisiile `-rwxrwx---`, ultimele 3 litere/liniute reprezentand drepturile setata la nivel de `other users`, iar alti users nu vor avea nici un fel de acces la acest fisier, decat daca sunt userul `stefan` sau parte din groupul `devops`.

### Cum putem valida ca permisiile sunt setate okay?

Vom incerca sa citim acum fisierul ca si user-ul `adrian`:

1. Rulam `exit`{{execute}}
2. Ne schimbam user-ul in `adrian` cu comanda `su adrian`{{execute}}
3. Rulam `cat /home/stefan/fisier.sh`{{execute}} si ar trebui sa primim o eroare precum `cat: /home/stefan/fisier.sh: Permission denied`
4. Primim `permission denied` deoarece user-ul `adrian` nu este nici `stefan` si nici parte din gropul de `devops`
5. Iesim din user-ul `adrian`: `exit`{{execute}}


## Concluzie

Am invatat cum sa cream users, groups, sa schimbam parole, sa adaugam users in groups, sa setam owners si sa schimbam permisii cu ajutorul comenzilor:

  - `chmod` ca sa schimbam permisii
  - `chown` ca sa schimbam owners
  - `whoami` ca sa verificam ce user suntem
  - `passwd` ca sa resetam parole
  - `su` ca sa ne schimbam in alt user
  - `groupadd` ca sa adaugam groups
  - `useradd` ca sa adaugam users
  - `usermod` ca sa adaugam un user la un group
