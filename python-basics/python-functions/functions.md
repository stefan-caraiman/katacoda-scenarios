Pentru a rula comenzi in Python putem porni terminalul interactiv cu comanda: `python3`{{execute}}

Functiile sunt bucati de cod care ne permit sa ne definim propriile actiuni si sa le refolosim.

O functie primeste deobicei un "input/argument", si ne va da in schimb un "output/rezultat".

De exemplu:

 - print: este o functie care primeste ca si input niste text si ne afiseaza dupa acel text pe ecran
 - len: este o functie care primeste o variabila si ne calculeaza lungimea valorii din variabila

Ca sa putem defini o functie ne folosim de `keyword`-ul `def` urmata de numele functii, asa Python va sti ca vrem sa ne definim o functie.

Functiile se definesc astfel:

`def <nume_functie>(<parametrii>):
    <cod>
`

Un exemplul de functie simpla ar fi:

`
def say_hello():
	print("Hello there!")
`{{execute}}

Functia se termina de scrisa in momentul in care nu mai scriem `TAB/Spatii` si dam `enter`.

Ca sa putem executa functia definita de noi, o facem la fel ca si cu orice alta functie:

`say_hello()`{{execute}}


Un exemplu de functie care primeste un argument ar fi:

`def greet(name):
	print("Hello " + name)
`{{execute}}

Functia `greet` de mai sus primeste un singur argument, `name` si ne va `print`-a `Hello` urmat de orice fel de nume i-am da ca si argument.

De exemplu:

`greet("John")`{{execute}}

Care ne va printa mesajul: `Hello John`

De asemenea putem crea functii care primesc mai multe argumente, de exemplu:

`def aduna(nr1, nr2):
	suma = nr1 + nr2
	print("Suma este: ", suma)
`{{execute}}

`
aduna(10, 25)`{{execute}}