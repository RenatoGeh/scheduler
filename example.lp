
% Time slots
slot(h8).  % 08h00 - 09h40
slot(h10). % 10h00 - 11h40
slot(h14). % 14h00 - 15h40
slot(h16). % 16h00 - 17h40

next(h8, h10).
next(h14, h16).
prev(h16, h14).
prev(h10, h8).

% Morning or afternoon classes
morning(h8; h10).
afternoon(h14; h16).

% Week days
day(mon).
day(tue).
day(wed).
day(thu).
day(fri).
day(mon, 2).
day(tue, 3).
day(wed, 4).
day(thu, 5).
day(fri, 6).

% Professors

prof(acvm).
prof(yoshiko).
prof(siang).
prof(pmiranda).
prof(alair).
prof(renata).
prof(kenji).
prof(mqz).
prof(sinai).
prof(kelly).
prof(finger).
prof(jef).
prof(guilherme).
prof(jb).
prof(coelho).
prof(gold).
prof(fujita).
prof(yoshi).
prof(cris).
prof(daniel).
prof(ddm).
prof(kon).
prof(ernesto).

% Subjects

subject(mac0121).
freq(mac0121, 2).
lectures(guilherme, mac0121).
undergrad(mac0121).

subject(mac0216).
freq(mac0216, 2).
lectures(daniel, mac0216).
undergrad(mac0216).

subject(mac0239).
freq(mac0239, 2).
lectures(finger, mac0239).
undergrad(mac0239).

subject(mac0313).
freq(mac0313, 2).
lectures(kelly, mac0313).
undergrad(mac0313).

subject(mac0315).
freq(mac0315, 2).
lectures(ernesto, mac0315).
undergrad(mac0315).

subject(mac0316).
freq(mac0316, 2).
lectures(acvm, mac0316).
undergrad(mac0316).

subject(mac0317).
freq(mac0317, 2).
lectures(mqz, mac0317).
undergrad(mac0317).

subject(mac0318).
freq(mac0318, 2).
lectures(ddm, mac0318).
undergrad(mac0318).
double(mac0318).

subject(mac0325).
freq(mac0325, 2).
lectures(kenji, mac0325).
undergrad(mac0325).

subject(mac0328).
freq(mac0328, 2).
lectures(kenji, mac0328).
undergrad(mac0328).

subject(mac0338).
freq(mac0338, 2).
lectures(cris, mac0338).
undergrad(mac0338).

subject(mac0344).
freq(mac0344, 2).
lectures(siang, mac0344).
undergrad(mac0344).

subject(mac0413).
freq(mac0413, 2).
lectures(kon, mac0413).
undergrad(mac0413).

subject(mac0414).
freq(mac0414, 2).
lectures(coelho, mac0414).
undergrad(mac0414).

subject(mac0426).
freq(mac0426, 2).
lectures(kelly, mac0426).
undergrad(mac0426).

subject(mac0459).
freq(mac0459, 2).
lectures(jef, mac0459).
undergrad(mac0459).

subject(mac0460).
freq(mac0460, 2).
lectures(jb, mac0460).
undergrad(mac0460).

subject(mac0472).
freq(mac0472, 2).
lectures(gold, mac0472).
undergrad(mac0472).
double(mac0472).

subject(mac0693).
freq(mac0693, 1).
lectures(yoshi, mac0693).
undergrad(mac0693).

subject(mac4722).
freq(mac4722, 2).
lectures(alair, mac4722).

subject(mac5737).
freq(mac5737, 2).
lectures(renata, mac5737).

subject(mac5754).
freq(mac5754, 2).
lectures(acvm, mac5754).

subject(mac5770).
freq(mac5770, 2).
lectures(yoshiko, mac5770).

subject(mac5910).
freq(mac5910, 2).
lectures(daniel, mac5910).

subject(mac6903).
freq(mac6903, 2).
lectures(pmiranda, mac6903).

subject(mac6919).
freq(mac6919, 2).
lectures(acvm, mac6919).

subject(mac6925).
freq(mac6925, 2).
lectures(sinai, mac6925).

subject(mac6954).
freq(mac6954, 2).
lectures(guilherme, mac6954).

subject(mac6992).
freq(mac6992, 2).
lectures(fujita, mac6992).

