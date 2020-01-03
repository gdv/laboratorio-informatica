---
layout: page
title: Elezioni
---

Si analizzino i dati del file [fl2000.csv](../dati/fl2000.csv), rappresentati i voti espressi in Florida nell’elezione
presidenziale del 2000. Le variabili sono: county, technology, columns, numero, oltre ad codice che
indica se si tratta di schede bianche, nulle o assegnate ad uno dei candidati, secondo la seguente tabella.

|   codice | significato     |
| -------- | --------------- |
|        1 | bianche         |
|        2 | nulle           |
|        3 | Bush            |
|        4 | Gore            |
|        5 | Browne          |
|        6 | Nader           |
|        7 | Harris          |
|        8 | Hagelin         |
|        9 | Buchanan        |
|       10 | McReynolds      |
|       11 | Phillips        |
|       12 | Moorehead       |
|       13 | Chote           |
|       14 | McCharthy       |

1.    Calcolare il numero totale di voti raccolti da ogni candidato (escluse schede bianche e nulle).
1.    Calcolare la percentuale di voti raccolti da ogni candidato (escluse schede bianche e nulle).
1.    Per ogni contea, determinare il candidato che ha ottenuto il numero massimo di voti.
1.    Calcolare il numero totale di voti per candidato distinto per tipo di colonne nella scheda (columns) e modalità di conteggio (technology). Rappresentare le informazioni in due tabelle (una per columns, una per technology).
1.    Creare una variabile che contenga i voti non validi (bianche + nulle). Dove si è verificato il numero massimo? E dove si è verificata la percentuale massima?
1.    In quante contee Nader ha ottenuto almeno il 2% dei voti validi?
