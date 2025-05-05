% Fakta: Gejala yang dimiliki Charizard
gejala(g1). % Suhu tubuh tinggi
gejala(g3). % Penurunan kekuatan serangan
gejala(g4). % Gerakan melambat
gejala(g12). % Kehilangan fokus

% Aturan diagnosis
status(s1, burn,        [g1, g2, g3, g4]).
status(s2, paralysis,   [g4, g5, g6, g3]).
status(s3, poison,      [g7, g8, g9, g14]).
status(s4, freeze,      [g10, g11, g5, g6]).
status(s5, overheat,    [g1, g4, g12, g3]).
status(s6, confusion,   [g12, g5, g13, g3]).
status(s7, fatigue,     [g4, g12, g14, g5]).

% Aturan kecocokan
cocok(GejalaPasien, GejalaStatus) :-
    intersection(GejalaPasien, GejalaStatus, GejalaCocok),
    length(GejalaCocok, L),
    L > 2. % Minimal 3 gejala cocok untuk diagnosa kuat

diagnosa(Kode, Nama) :-
    findall(G, gejala(G), GejalaPasien),
    status(Kode, Nama, GejalaStatus),
    cocok(GejalaPasien, GejalaStatus).
