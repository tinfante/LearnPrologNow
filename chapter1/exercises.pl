% Exercise  1.1 Which of the following sequences of characters are atoms,
% which are variables, and which are neither?
%
%     vINCENT                       => atom
%     Footmassage                   => var
%     variable23                    => atom
%     Variable2000                  => var
%     big_kahuna_burger             => atom
%     'big  kahuna  burger'         => atom
%     big  kahuna  burger           => none
%     'Jules'                       => atom
%     _Jules                        => var
%     '_Jules'                      => atom

% Exercise  1.2 Which of the following sequences of characters are atoms,
% which are variables, which are complex terms, and which are not terms at
% all? Give the functor and arity of each complex term.
%
%     loves(Vincent,mia)                    => complex, loves/2
%     'loves(Vincent,mia)'                  => atom
%     Butch(boxer)                          => none
%     boxer(Butch)                          => complex, boxer/1
%     and(big(burger),kahuna(burger))       => complex, and/2 big/1 kahuna/1
%     and(big(X),kahuna(X))                 => complex, and/2 big/1 kahuna/1
%     _and(big(X),kahuna(X))                => none
%     (Butch  kills  Vincent)               => none
%     kills(Butch  Vincent)                 => none
%     kills(Butch,Vincent                   => none

% Exercise  1.3 How many facts, rules, clauses, and predicates are there in
% the following knowledge base? What are the heads of the rules, and what
% are the goals they contain?
%
%    woman(vincent).
%    woman(mia).
%    man(jules).
%    person(X):-  man(X);  woman(X).
%    loves(X,Y):-  father(X,Y).
%    father(Y,Z):-  man(Y),  son(Z,Y).
%    father(Y,Z):-  man(Y),  daughter(Z,Y).
%
%   3 facts, 4 rules, 7 clauses, 7 predicates.
%   The heads are what comes before ":-", the goals what comes after.

% Exercise  1.4 Represent the following in Prolog:
%
%     Butch is a killer.
%     Mia and Marsellus are married.
%     Zed is dead.
%     Marsellus kills everyone who gives Mia a footmassage.
%     Mia loves everyone who is a good dancer.
%     Jules eats anything that is nutritious or tasty.

killer(butch).
married(mia, marsellus).
dead(zed).
kills(marsellus, X) :-
  foot_massage(X, mia).
loves(mia, X) :-
  good_dancer(X).
eats(jules, X) :-
  nutricious(X);
  tasty(X).

% Exercise  1.5 Suppose we are working with the following knowledge base:

wizard(ron).
hasWand(harry).
quidditchPlayer(harry).
wizard(X):-  hasBroom(X),  hasWand(X).
hasBroom(X):-  quidditchPlayer(X). 

% How does Prolog respond to the following queries?
%
%     wizard(ron)                       => true
%     witch(ron)                        => error
%     wizard(hermione)                  => false
%     witch(hermione)                   => error
%     wizard(harry)                     => true
%     wizard(Y) =>                      => ron; harry
%     witch(Y) =>                       => error
