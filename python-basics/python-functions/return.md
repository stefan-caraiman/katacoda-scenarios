In python mai exista un cuvant cheie/`keyword` pe care il putem folosi la functii.

Aceste este `return`. `return` ne permite sa avem valori ca si output.

De exemplu, functia len ne va `return`-a mereu valoarea unei variabile:

`l = len("john")
print(l)`{{execute}}

In exemplul de mai sus, functia `len` ne calculeaza cate litere sunt in valoarea "john" si ne `return`-eaza aceasta valoare.

Exemplu de functie care `return`-eaza o valoare:

`
def inmultire(numar):
	return numar * 2
`{{execute}}

Aceasta functia va lua `numar`, il va inmulti cu `2` si ne da `return`-a valoarea inmultirii.

`inmultire(8)`{{execute}}

Sau putem sa salvam valoarea `return`-ata intr-o variabila:

`total = inmultire(10)
print(total)`{{execute}}

Alte exemple de functii care ne `return`-eaza un output:

`
def aduna_numere(numar1, numar2):
	return numar1 + numar2
`{{execute}}

`aduna_numere(150, 25)`{{execute}}
