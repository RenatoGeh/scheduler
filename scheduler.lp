% The number of generated schedules for a subject is defined by its frequency.
{ at(X, T, W) : subject(X), slot(T), day(W) } = C :- freq(X, C).

% Adjacent time slots.
adjacent(S, T) :- slot(S), slot(T), next(S, T), S != T.
adjacent(S, T) :- slot(S), slot(T), prev(S, T), S != T.
-adjacent(S, T) :- not adjacent(S, T), slot(S), slot(T), S != T.

% Doubles must go on the same day and at adjacent time slots.
:- double(X), at(X, R, W), at(X, T, U), U != W.
:- double(X), at(X, R, W), at(X, T, U), -adjacent(R, T).

% Prefer that doubles go on afternoons.
:~ double(X), at(X, T, W), morning(T). [1@0]

% A professor cannot lecture more than one subject taking place at the same time slot.
:- lectures(P, X), lectures(Q, Y), at(Y, W, R), at(X, U, T), X != Y, R == T, P == Q, W == U.

% Prefer slots which are not on the same day.
:~ subject(X), at(X, R, W), at(X, T, U), W == U, R != T. [1@0]

% Prefer subjects with alternated slots.
:~ subject(X), at(X, R, W), at(X, T, U), day(W, N), day(U, M), |N-M| == 1, R != T. [1@0]

% No undergraduate subject must be placed on a Friday afternoon.
:- subject(X), at(X, T, W), afternoon(T), W == fri.

% A subject is on a day if it's scheduled on that week day.
on(W, R, C) :- C = #count { X,R,W : at(X, R, W), subject(X) }, day(W), slot(R).

% Minimize the number of classes in a day.
#minimize { C : on(W, R, C), day(W), slot(R) }.

% Show only schedule results.
#show at/3.

% Debug variables.
%#show on/3.
