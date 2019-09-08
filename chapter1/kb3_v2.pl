happy(vincent).

listens2music(butch).

playsAirGuitar(vincent) :-
  happy(vincent),
  listens2music(vincent).

playsAirGuitar(butch) :-
  happy(butch);
  listens2music(butch).
