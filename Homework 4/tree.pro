% Homework 4: Binary Search Tree
% Maddie Waldie, COEN 171, 12/2/22

% insert(X,Y,Z): Succeeds if Z can be unified to a tree that is the result of inserting the value X into Y.
insert(node(L, X, R), X, node(L, X, R)).
insert(node(L, Y, R), X, node(LS, Y, R)) :- 
    X < Y, 
    insert(L, X, LS).
insert(node(L, Y, R), X, node(L, Y, RS)) :- 
    X > Y, 
    insert(R, Y, RS).

% exists(X,Y): Succeeds if the integer value X is present in the tree Y.
exists(X, node(_, X, _)).
exists(X, node(L, Y, _)) :- 
    exists(X, L), 
    X < Y.
exists(X, node(_, Y, R)) :- 
    exists(X, R), 
    Y < X.
