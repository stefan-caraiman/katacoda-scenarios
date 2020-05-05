O alta functionalitate pe care listele o au, este cea de `methods`.

Metodele sunt functii specifice unui tip de date.

Acestea se scriu cu `.` urmate de numele metodei.

De exemplu, listele au o metoda numita `reverse`, care ne va inversa ordinea elementelor din lista.

`lista = [0, 1, 2, 3]
print(lista)
lista.reverse() # Ne folosim de metoda reverse
print(lista)
`{{execute}}

Prin exemplul de mai sus putem observa cum, valorile din lista sunt in ordine inversa decat cea pe care am scris-o cand am creat variabila.


O alta metoda utila este metoda `.append()`, care ne permite sa adaugam elemente aditionale la o lista:

`a = ["hi", "hello"]
print(a)
a.append("bye")
print(a)`{{execute}}

De asemenea putem adauga elemente si la anumite pozitii prin a folosi metoda `.insert()`:

`a = ["apple", "banana"]
print(a)
a.insert(0, "kiwi")
print(a)`{{execute}}

Metoda `.insert()` primeste ca si argumente, index-ul/pozitia unde vrem valoarea si valoarea pe care vrem sa o adaugam.
