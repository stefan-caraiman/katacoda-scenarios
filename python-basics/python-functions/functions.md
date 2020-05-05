Pentru a rula comenzi in Python putem porni terminalul interactiv cu comanda: `python3`{{execute}}

Functiile sunt bucati de cod care ne permit sa ne definim propriile actiuni.

De exemplu:

 - print ne permite sa afisam pe ecran text
 - len ne permite sa calculam lungimea variabilelor/cate elemente sunt

Astfel incat, putem si noi sa ne cream propriile functii cu propria noastra "custom logic/custom actions".

Ca sa putem defini o functie ne folosim de `keyword`-ul `def` urmata de numele functii, asa Python va sti ca vrem sa ne definim o functie.

Functiile se definesc astfel:

`def <nume_functie>(<parametrii>):
    <cod>
`

Nu uita sa pui cele `:` la finalul liniei care incepe cu `def`, si sa punem `TAB/Spatii` pe fiecare linie care este cuprinsa in codul de functie.

Un exemplul de functie simpla ar fi:

`def say_hello():
	print("Hello there!")
	a = 10
	b = 5
	total = a + b
	print("a + b =", total)
`{{execute}}

Functia se termina de scrisa in momentul in care nu mai scriem `TAB/Spatii` si dam `enter`.

Si ca sa putem rula/executa functia definita de noi, o facem la fel ca si cu orice alta functie:

`say_hello()`


Un exemplu de functie care primeste un argument ar fi:

`def greet(name):
	print("Hello " + name)
`{{execute}}

Functia `greet` de mai sus primeste un singur argument, `name` si ne va `print`-a `Hello` urmat de orice fel de nume i-am da ca si argument.

De exemplu:

`greet("John")`{{execute}}

Care ne va printa mesajul: `Hello John`