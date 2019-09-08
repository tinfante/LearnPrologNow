% Exercise  2.1 Which of the following pairs of terms unify? Where relevant,
% give the variable instantiations that lead to successful unification.
%
%    (Assuming all these expressions are followed by a period)
%
%    bread  =  bread                                    => true
%    'Bread'  =  bread                                  => false
%    'bread'  =  bread                                  => true
%    Bread  =  bread                                    => true
%    bread  =  sausage                                  => false
%    food(bread)  =  bread                              => false
%    food(bread)  =  X                                  => true. X = food(bread)
%    food(X)  =  food(bread)                            => true. X = bread.
%    food(bread,X)  =  food(Y,sausage)                  => true. X = sausage, Y = bread.
%    food(bread,X,beer)  =  food(Y,sausage,X)           => false
%    food(bread,X,beer)  =  food(Y,kahuna_burger)       => false
%    food(X)  =  X                                      => true. X = food(X)
%    meal(food(bread),drink(beer))  =  meal(X,Y)        => true. X = food(bread), Y = drink(beer)
%    meal(food(bread),X)  =  meal(X,drink(beer))        => false

% Exercise 2.2 We are working with the following knowledge base:

house_elf(dobby).
witch(hermione).
witch('McGonagall').
witch(rita_skeeter).
magic(X):-  house_elf(X).
%magic(X):-  wizard(X).  % causes every magic() query to fail.
magic(X):-  witch(X).

% Which of the following queries are satisfied? Where relevant, give all the
% variable instantiations that lead to success.
%
%    ?-  magic(house_elf)               => false
%    ?-  wizard(harry).                 => error. wizard undefined.
%    ?-  magic(wizard).                 => false
%    ?-  magic('McGonagall').           => true
%    ?-  magic(Hermione).               => true. X=dobbie; X=hermione; etc
%
% Draw the search tree for the query magic(Hermione). => No.


% Exercise 2.3 Here is a tiny lexicon (that is, information about individual
% words) and a mini grammar consisting of one syntactic rule (which defines
% a sentence to be an entity consisting of five words in the following order:
% a determiner, a noun, a verb, a determiner, a noun).

word(determiner,a).
word(determiner,every).
word(noun,criminal).
word(noun,'big  kahuna  burger').
word(verb,eats).
word(verb,likes).

sentence(Word1,Word2,Word3,Word4,Word5):-
    word(determiner,Word1),
    word(noun,Word2),
    word(verb,Word3),
    word(determiner,Word4),
    word(noun,Word5).

% What query do you have to pose in order to find out which sentences the
% grammar can generate? List all sentences that this grammar can generate in
% the order that Prolog will generate them in.
%
% To list all sentences:
%     sentence(W1, W2, W3, W4, W5).
%
% Which will return:
%     a criminal eats a criminal
%     a criminal eats a big kahuna burger
%     a criminal eats every criminal
%     a criminal eats every big kahuna burger
%     a criminal likes a criminal
%     ... etc
%
% In the order they appear in source code, with repetition, and back-tracking
% when options run out.


%  Exercise 2.4 Here are six Italian words:
%
%  astante, astoria, baratto, cobalto, pistola, statale.
%
%  They are to be arranged, crossword puzzle fashion, in the following grid:
%
%                            V1  V2  V3                         
%                             _   _   _
%                           _|_|_|_|_|_|_
%                       H1 |_|_|_|_|_|_|_|
%                           _|_|_|_|_|_|_
%                       H2 |_|_|_|_|_|_|_|
%                           _|_|_|_|_|_|_
%                       H3 |_|_|_|_|_|_|_|
%                            |_| |_| |_|
%
% The following knowledge base represents a lexicon containing these words: 

word(astante,  a,s,t,a,n,t,e).
word(astoria,  a,s,t,o,r,i,a).
word(baratto,  b,a,r,a,t,t,o).
word(cobalto,  c,o,b,a,l,t,o).
word(pistola,  p,i,s,t,o,l,a).
word(statale,  s,t,a,t,a,l,e).

% Write a predicate crossword/6 that tells us how to fill in the grid. The
% first three arguments should be the vertical words from left to right, and
% the last three arguments the horizontal words from top to bottom.

crossword(V1, V2, V3, H1, H2, H3) :-
    word(V1, _, LV1H1, _, LV1H2, _, LV1H3, _),
    word(V2, _, LV2H1, _, LV2H2, _, LV2H3, _),
    word(V3, _, LV3H1, _, LV3H2, _, LV3H3, _),
    word(H1, _, LV1H1, _, LV2H1, _, LV3H1, _),
    word(H2, _, LV1H2, _, LV2H2, _, LV3H2, _),
    word(H3, _, LV1H3, _, LV2H3, _, LV3H3, _),
    \=(V1, H1),
    \=(V2, H2),
    \=(V3, H3).

