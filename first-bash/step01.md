In Bash asterisk-ul/*/steluta ne ajuta la gasirea de fisiere care se incadreaza intr-un format.

Aceasta proprietate se mai numeste si `wildcard`.

Cum se foloseste aceasta functionalitate:

Daca rulam: `ls file*`{{execute}} vom observa ca `ls` ne va arata doar fisierele care incep cu `file`.

`*` de dupa `file` va face sa gaseasca orice fisier care incepe cu `file`.

Sau comanda: `ls *.sh`{{execute}} ne va lista toate fisierele care se termina cu `.sh`. `*` poate fi folosit si pentru gasirea fisierelor cu un anumit prefix cat si cu un anumit sufix.

De asemenea `ls *.txt`{{execute}} ne va lista orice fisier care se termine cu `.txt`

Ne putem folosi de functionlitatea `*` si in alte comenzi precum `chmod`.

De exemplu daca vrem sa setam permisii de executabil pentru toate fisierele care se termina cu `.sh` putem rula:

`chmod +x *.sh`{{execute}} astfel prin a folosi `*`, vom filtra dupa orice fisier care se termina cu `*.sh` si dupa ii zicem lui `chmod` sa il faca executabil.

Daca rulam din nou `ls *.sh`{{execute}} observam ca scripturile sunt colorate cu verde, insemnand ca sunt executabile.

Sau daca ne dorim sa stergem toate fisierele care incep cu `file`, putem rula: `rm -vf file*`{{execute}}

# Concluzie

`*` este folosit pentru a face matching/find pe orice fisier care se incadreaza formatului pe care il dam. Este deseori folosite ca sa rulam aceasi comanda pe un tip de fisier sau fisiere cu un anumit nume.
