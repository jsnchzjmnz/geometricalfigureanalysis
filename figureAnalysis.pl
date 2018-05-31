conecta(1,2).
conecta(1,3).
conecta(2,3).
conecta(2,4).
conecta(2,5).
conecta(3,5).
conecta(3,6).
conecta(4,5).
conecta(5,6).
conecta(4,7).
conecta(4,8).
conecta(7,8).
conecta(5,8).
conecta(5,9).
conecta(8,9).
conecta(6,9).
conecta(6,10).
conecta(9,10).
conecta(7,11).
conecta(7,12).
conecta(11,12).
conecta(8,12).
conecta(8,13).
conecta(12,13).
conecta(9,13).
conecta(9,14).
conecta(13,14).
conecta(10,14).
conecta(10,15).
conecta(14,15).
conecta(11,16).
conecta(11,17).
conecta(16,17).
conecta(12,17).
conecta(12,18).
conecta(17,18).
conecta(13,18).
conecta(13,19).
conecta(18,19).
conecta(14,19).
conecta(14,20).
conecta(19,20).
conecta(15,20).
conecta(15,21).
conecta(20,21).
conecta(16,22).
conecta(16,23).
conecta(22,23).
conecta(17,23).
conecta(17,24).
conecta(23,24).
conecta(18,24).
conecta(18,25).
conecta(24,25).
conecta(19,25).
conecta(19,26).
conecta(25,26).
conecta(20,26).
conecta(20,27).
conecta(26,27).
conecta(21,27).
conecta(21,28).
conecta(27,28).
conecta(22,29).
conecta(22,30).
conecta(23,30).
conecta(29,30).
conecta(23,31).
conecta(30,31).
conecta(24,31).
conecta(24,32).
conecta(31,32).
conecta(25,32).
conecta(25,33).
conecta(32,33).
conecta(26,33).
conecta(26,34).
conecta(33,34).
conecta(27,34).
conecta(27,35).
conecta(34,35).
conecta(28,35).
conecta(28,36).
conecta(35,36).
conecta(29,37).
conecta(29,38).
conecta(37,38).
conecta(30,38).
conecta(30,39).
conecta(38,39).
conecta(31,39).
conecta(31,40).
conecta(39,40).
conecta(32,40).
conecta(32,41).
conecta(40,41).
conecta(33,41).
conecta(33,42).
conecta(41,42).
conecta(34,42).
conecta(34,43).
conecta(42,43).
conecta(35,43).
conecta(35,44).
conecta(43,44).
conecta(36,44).
conecta(36,45).
conecta(44,45).

distancia(X,Y,R):-distanciaAux(X,Y,R).
distanciaAux(X,Y,R):-conecta(X,Y), R is 1.
distanciaAux(X,Y,R):-conecta(X,Z), distanciaAux(Z,Y,R2), R is R2+1.

triangulo(A,B,C):- distancia(A,B,R1),distancia(B,C,R2),distancia(A,C,R3),R1=:=R2,R2=:=R3,R1=:=R3.

hexagono(A,B,C,D,E,F):-distancia(A,F,R1),distancia(B,E,R2),distancia(C,D,R3),distancia(A,B,R4),distancia(E,F,R5),distancia(A,C,R6),distancia(C,E,R7),distancia(B,D,R8),distancia(D,F,R9),R1=:=R2,R2=:=R3,R4=:=R5,R5=:=R6,R6=:=R7,R7=:=R8,R8=:=R9.

paralelogramo(A,B,C,D):- distancia(A,B,R1), distancia(C,D,R2), distancia(A,C,R3), distancia(B,D,R4),R1=:=R2,R2=:=R3,R3=:=R4.

largo_lista([],0).
largo_lista([_|Resto],R):- largo_lista(Resto,R2), R is 1+R2 .

posibleTriangulo(Lista):- largo_lista(Lista,R), R=:=3.
posibleParalelogramo(Lista):- largo_lista(Lista,R), R=:=4.
posibleHexagono(Lista):- largo_lista(Lista,R), R=:=6.

primerElemento([X|Resto],X,Resto).
lista_a_elementos3(Lista,X,Y,Z):- primerElemento(Lista,X,L1),primerElemento(L1,Y,L2),primerElemento(L2,Z,_).
lista_a_elementos4(Lista,W,X,Y,Z):- primerElemento(Lista,W,L1),primerElemento(L1,X,L2),primerElemento(L2,Y,L3),primerElemento(L3,Z,_).
lista_a_elementos6(Lista,U,V,W,X,Y,Z):- primerElemento(Lista,U,L1),primerElemento(L1,V,L2),primerElemento(L2,W,L3),primerElemento(L3,X,L4),primerElemento(L4,Y,L5),primerElemento(L5,Z,_).

evaluarFigura(Lista):-posibleTriangulo(Lista),msort(Lista,L),lista_a_elementos3(L,X,Y,Z),triangulo(X,Y,Z),write('Es un triangulo').
evaluarFigura(Lista):-posibleParalelogramo(Lista),msort(Lista,L),lista_a_elementos4(L,W,X,Y,Z),paralelogramo(W,X,Y,Z),write('Es un paralelogramo').
evaluarFigura(Lista):-posibleHexagono(Lista),msort(Lista,L),lista_a_elementos6(L,U,V,W,X,Y,Z),hexagono(U,V,W,X,Y,Z),write('Es un hexagono').

evaluar(Lista):-not(evaluarFigura(Lista)),write('Figura No Valida').

procesar(Lista):-not(evaluar(Lista)).
