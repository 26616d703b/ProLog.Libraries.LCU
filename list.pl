													% LIST

						% [A]						
		
append([], L, L).
append([H|R1], L, [H|R2]):- append(R1, L, R2).
						
average(L, A):- sum(L, S), length(L, N), A is S/N.

						% [C]

compress([],[]).
compress([X,X|L1],[X|L2]):- compress(L1,L2).
compress([X,Y|L1],[X,Y|L2]):- X \= Y, compress(L1,L2).
						
construct(H, R, [H|R]).
						
						% [D]
						
duplicate([], []).
duplicate([H|R1], [H, H|R2]):- duplicate(R1, R2).

						% [F]
						
first([H|_], H).

						% [I]
						
interpose([],X,X).
interpose(X,[],X).
interpose([X|Xs],[Y|Ys],[X,Y|R]):- interpose(Xs,Ys,R).

isList([]).
isList([_|R]):- isList(R).
						
isMember(X, [X|_]).
isMember(X, [_|R]):- isMember(X, R).

notMember(X, L):- not(isMember(X, L)).

						% [L]

lastOf([X], X).
lastOf([_|R], X):- lastOf(R, X).
						
lengthOf([], 0).
lengthOf([_|R], N):- lengthOf(R, Nr), N is Nr+1.

						% [N]
						
follows(X, Y, [X, Y|_]).
follows(X, Y, [_|R]):- follows(X, Y, R).

						% [O]

occurrences(_, [], 0).
occurrences(X, [X|R], N):- occurrences(X, R, N1), N is N1+1.
occurrences(X, [Y|R], N):- X \= Y, occurrences(X, R, N).
						
						% [P]

palindrome(L):- reverse(L, L).

partition(_, [], [], []).
partition(X, [T|R], [T|Li], Ls):- T < X, partition(X, R, Li, Ls).
partition(X, [T|R], Li, [T|Ls]):- T >= X, partition(X, R, Li, Ls).

prefix([],_).
prefix([X|R1], [X|R2]):- prefix(R1, R2).

prepend(X, L, [X|L]).
						
						% [R]

remove(X, [X|R], R).
remove(X, [Y|R1], [Y|R2]):- X \= Y, remove(X, R1, R2).

replace(_,_,[],[]).	
replace(X, Y, [X|R1], [Y|R2]):- replace(X, Y, R1, R2).
replace(X, Y, [T|R1], [T|R2]):- X \= T, replace(X, Y, R1, R2).
	
rest([_|R], R).
						
reverse([], []).
reverse([H|R], IL):- reverse(R, L), append(L, [H], IL).
						
						% [S]

single(X, [X|R]):- not(memberOf(X, R)).
single(X, [Y|R]):- Y \= X, single(X, R).
	
slice([], _, _, []).
slice([H|_], 1, 1, [H]).
slice([H|R1], 1, K, [H|R2]):- K > 1, K1 is K-1, slice(R1, 1, K1, R2).
slice([_|R], I, K, L):- I > 1, I1 is I-1, K1 is K-1, slice(R, I1, K1, L).
	
subList(SL, L):- prefix(SL, L).
subList(X, [_|R]):- subList(X, R).
	
suffix(L, L).
suffix(L1, [_|L2]):- suffix(L1, L2).
	
sum([], 0).
sum([H|R], S):- sum(R, S1), S is S1+H.

sumOfPositiveIntegers([], 0).
sumOfPositiveIntegers([H|R], S):- (H >= 0 -> sumOfPositiveIntegers(R, S1), S is S1+H ; sumOfPositiveIntegers(R, S)).

sumOfNegativeIntegers([], 0).
sumOfNegativeIntegers([H|R], S):- (H < 0 -> sumOfNegativeIntegers(R, S1), S is S1+H ; sumOfNegativeIntegers(R, S)).

sumOfPositiveAndNegativeIntegers([], 0, 0).
sumOfPositiveAndNegativeIntegers([H|R], SP, SN):- H >= 0, sumOfPositiveAndNegativeIntegers(R, SP1, SN), SP is SP1+H.
sumOfPositiveAndNegativeIntegers([H|R], SP, SN):- H < 0, sumOfPositiveAndNegativeIntegers(R, SP, SN1), SN is SN1+H.
