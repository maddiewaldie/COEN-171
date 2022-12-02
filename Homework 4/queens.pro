% queens(X): Succeeds if X can be unified to a chessboard containing a solution to problem of placing eight
% Homework 4: 8 Queens
% Maddie Waldie, COEN 171, 12/2/22

% queens on the board such that no queen can attack another.

% Hints: Represent the board as a list of positions. Each position is a term consisting of the row and column number
% of a queen such as R/C or piece(R,C). Since each queen must be placed in a different row, unify each row variable
% with its row number so that you need only solve for the column number.

safe(_, [R/C]).
safe(R1/C1, [R2/C2|T]) :- 
    C1 =\= C2,
    C1 - C2 =\= R1 - R2,
    C1 - C2 =\= R2 - R1,
    safe(R1/C1, T).

range(L, U, L) :-
    U >= L.
range(L, U, X) :-
    U > L, 
    N is L + 1, 
    range(N,U,X).

build(R/C, [], [R/C]).
build(R/C, B, R) :-
    safe(R/C, B),
    append(R/C, B, R).

queens(B) :-
    bagof(X/Y, build(X/Y, R, B), B).