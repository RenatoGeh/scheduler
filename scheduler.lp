% The number of generated schedules for a subject is defined by its frequency.
{ at(X, T, W) : subject(X), slot(T), day(W) } = C :- freq(X, C).

% If class is a double ("dobradinha"), then it should also take the next time slot.
at(X, T, W) :- double(X), subject(X), at(X, R, W), next(R, T).

% Prefer that doubles go on afternoons.
:~ double(X), at(X, T, W), morning(T). [1@0]

% A professor cannot lecture more than one subject taking place at the same time slot.
:- lectures(P, X), lectures(Q, Y), at(Y, W, R), at(X, U, T), X != Y, R == T, P == Q, W == U.

% Prefer slots which are not on the same day.
%:- subject(X), at(X, R, W), at(X, T, U), W == U, R != T.
:~ subject(X), at(X, R, W), at(X, T, U), W == U, R != T. [1@0]

% Prefer subjects with alternated slots.
%:- subject(X), at(X, R, W), at(X, T, U), day(W, N), day(U, M), |N-M| == 1, R != T.
:~ subject(X), at(X, R, W), at(X, T, U), day(W, N), day(U, M), |N-M| == 1, R != T. [1@0]

% No undergraduate subject must be placed on a Friday afternoon.
:- subject(X), at(X, T, W), afternoon(T), W == fri.

% Show only schedule results.
#show at/3.

% Debug variables.
%#show f/3.
