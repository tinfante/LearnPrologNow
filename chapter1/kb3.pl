happy(vincent).

listens2music(butch).

playsAirGuitar(vincent) :-
  happy(vincent),
  listens2music(vincent).

playsAirGuitar(butch) :-
  happy(butch).

playsAirGuitar(butch) :-
  listens2music(butch).
