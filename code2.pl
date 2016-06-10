/*Suppose that five ones and four zeros are arranged around a circle. Between any two
equal bits you insert a 0 and between any two unequal bits you insert a 1 to produce
nine new bits. Then you erase the nine original bits. Show that when you iterate this
procedure, you can never get nine zeros. [Hint: Work backword, assuming that you
did end up with nine zeros.]*/

/* If 010011110 exits around table and we trying to find what to get according to comparisions we should write :
* ?- arrange_circle([0,1,0,0,1,1,1,1,0],Y).
* Y = [0, 1, 1, 0, 1, 0, 0, 0, 1].
* Here is the logic:  first we should compare first and last element, they are same so 1 is added as first element.Then first and
* second element compared.They are different so 1 is added as second element.It goes like this and  [0, 1, 1, 0, 1, 0, 0, 0, 1]  should 
* returned.
* 
* If we are trying to search  [0, 1, 1, 0, 1, 0, 0, 0, 1] is received according to comparisions, we should write :
* ?- arrange_circle(Y, [0, 1, 1, 0, 1, 0, 0, 0, 1] ).
* Y = [0, 1, 0, 0, 1, 1, 1, 1, 0] .
* 
* According to this logic we can show 000000000 can never be received like this: 
* ?- arrange_circle(Y,[0,0,0,0,0,0,0,0,0]).
* false.
*/

:- use_module(library(clpfd)).

occur(_,[],0).
occur(A,[A|T],N) :- occur(A,T,N1), N#= N1+1.
occur(A,[H|T],N) :- occur(A,T,N). 

/** occur looks for an element how many times occured in given list. */

first_element([H|T],H). /** first_element shows first element of list. */


arrange_circle(L1,L2) :- length(L1,9), occur(1,L1,P), P#= 5, occur(0,L1,R), R#= 4, first_element(L1,F), last(L1,L),
						 L#= F, init(0,L1,L2).

arrange_circle(L1,L2) :- length(L1,9), occur(1,L1,P), P#= 5, occur(0,L1,R), R#= 4, first_element(L1,F), last(L1,L),
						 L#\= F, init(1,L1,L2).		

/** arrange_circle takes two arguments. First argument is what are around table first. Then 0 and 1 added between them according to problem
* definition in assignment. And result is showed as second argument L2. */


init(A,Xs,[A|L]) :- comp(Xs,L). 

/** init adds 1 or 0 as first element of L2, according to whether first element of list and last element of list are same or 
* different. Then calls comp to compare first and second element of given list. According to that adds 1 or 0.  */

comp([H,J|T],[0|L]) :- comp([J|T],L),J#=H.
comp([H,J|T],[1|L]) :- comp([J|T],L),J#\=H.
comp([H],[]).

/** comp compares first and second element of given list. According to that, adds 1 or 0 to second list. And does this recursively 
* until it becomes empty. Then result is returned.  */

