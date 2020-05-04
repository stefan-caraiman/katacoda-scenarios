Listele in Python pot fi accesate prin "index".
Index-ul se refera la pozitia unui element din lista.
Index-ul/pozitiile sunt numerotate de la 0.

De exemplu, mai jos avem o bucata de cod care ne va crea o variabile de tip list.
Dupa care vom incerca sa accesam valorile din lista folosindune de index/pozitie. (trebuie sa ne asiguram sa punem paranteze patrate ca sa putem specifica ce index/pozitie de element vrem)

`lista = ["text", 100, 54, 3, "hello"]
lista[0] # acesta ne va da valoarea "text", primul element din lista
lista[1]
lista[2]`{{execute}}

De asemenea, Python are conceptul de "slice" (bucata).
Acesta se refera la faptul ca ne permite sa accesam doar o bucata dintr-o lista.

De exemplu, daca vrem sa accesam doar primele 3 valori din lista:

`lista[0:3]`{{execute}}

Sau valorile intre pozitia 2 si 4:

`lista[2:4]`{{execute}}

Putem accesa si valori incepand cu un index, pana la final:

`lista[2:]`{{execute}}

Bucata de mai sus ne va da toate elementele din lista, incepand de la pozitia 2 pana la final. Se va duce pana la finalul listei din cauza `:`.


O functionalitate a Python-ului este ca acesta suporta si index negativi/cu semnul minus in fata.

De exemplu `[-1]` index-ul "-1" ne va da mereu ultimul element dintr-o lista:

`lista[-1]`{{execute}}

Sau index-ul `[-2]` ne va da penultimul element(s.a.m.d):

`lista[-2]`{{execute}}

Astfel incat un index negativ va porni mereu de la capatul listei, spre deosebire de un index pozitiv(fara minus), care va incepe numaratoarea de elemente de la 0, adica inceputul listei.

Ce este important de retinut este ca index-ul ne poate ajuta sa obtinem usor valori de la o anumita pozitie dintr-o lista.