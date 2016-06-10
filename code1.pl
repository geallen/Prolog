/**Prove that there are 100 consecutive positive integers that are not perfect squares.*/
/
* here is mathematical proof: The difference between squares of two consecutive positive integers is (n+1)(n+1) - (n*n) = 2*n+1. So there are 2n 
* nonsqaure numbers. From 2n = 100 n is 50.So there are 100 consecutive positive integers that are not perfect squares, between squares of 50 
* and 51.From 2501 to 2601.
*/

removelast([X|Xs], Ys) :-                
removelast_a(Xs, Ys, X).           
/** removelast removes last element of list.*/
removelast_a([], [], _).
removelast_a([X1|Xs], [X0|Ys], X0) :-  
removelast_a(Xs, Ys, X1).     

removefirst([_|Tail], Tail). /**removefirst removes first element of list*/

number_list(X, X, [X]).
number_list(T, S, [T | Result]) :- T =< S, T1 is T+1, number_list(T1, S, Result). /** between T and S range it returns a list */

returnList(X,Y,K) :- D is X*X, E is Y*Y, number_list(D,E,F), removefirst(F,S), removelast(S,K). /** This returns a list with numbers between squares
 * of X and Y */

:- use_module(library(clpfd)).
perfect(A,W) :- N in 0..55, A#= (N+1)*(N+1)-(N*N)-1, label([N]), C#= N+1, returnList(N,C,W).

/** In perfect for some N, the equation (N+1)*(N+1)-(N*N)-1 is calculated and N found as 50. 
* Then the numbers from square of 50 to 51 is showed. */

/** How to run ?- perfect(100,K).
* K = [2501, 2502, 2503, 2504, 2505, 2506, 2507, 2508, 2509|...] .
*/
