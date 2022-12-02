% Homework 4: Quicksort
% Maddie Waldie, COEN 171, 12/2/22

% quicksort(X,Y): Succeeds if Y can be unified with a list containing the sorted elements of X.
quicksort([], []).
quicksort([X|XS], Y) :- 
    partition(X, XS, A, B), 
    quicksort(A, AS), 
    quicksort(B, BS), 
    append(AS, [X|BS], Y).

% Hints: Write a relation partition that partitions a list into two lists, one containing the elements below the pivot
% element, and another containing the elements above the pivot element.
partition(_, [], [], []).
partition(P, [X|XS], [X|YS], ZS) :- 
    X < P, 
    partition(P, XS, YS, ZS).
partition(P, [X|XS], YS, [X|ZS]) :- 
    X >= P, 
    partition(P, XS, YS, ZS).