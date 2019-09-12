% Exercise 3.1. In the text, we discussed the predicate
%
% descend(X, Y) :- child(X, Y).
% descend(X, Y) :- child(X, Z),
%     descend(Z, Y).
%
% Suppose we reformulated this predicate as follows:
%
% descend(X, Y) :- child(X, Y).
% descend(X, Y) :- descend(X, Z),
%                  descend(Z, Y).
%
% Would this be problematic?
%
% Yes, unless the first rule is matched, it would cause infinite recursion
% and a stack overflow.

% Exercise 3.2. Do you know these wooden Russian dolls (Matryoshka dolls)
% where the smaller ones are contained in bigger ones? Here is a schematic
% picture:
%
%
% First, write a knowledge base using the predicate directlyIn/2 which encodes
% which doll is directly contained in which other doll. Then, define a
% recursive predicate in/2 , that tells us which doll is (directly or
% indirectly) contained in which other dolls. For example, the query
% in(katarina,natasha) should evaluate to true, while in(olga,  katarina)
% should fail.

directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha, irina).

in(X, Y) :- directlyIn(X, Y).
in(X, Y) :- directlyIn(X, Z),
            in(Z, Y).


% Exercise 3.3. We have the following knowledge base:

directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

% That is, this knowledge base holds facts about towns it is possible to
% travel between by taking a direct train. But of course, we can travel
% further by chaining together direct train journeys. Write a recursive
% predicate travelFromTo/2 that tells us when we can travel by train between
% two towns. For example, when given the query
%
%   travelFromTo(nancy,saarbruecken).
%
% it should reply yes.

travelFromTo(A, C) :- directTrain(A, C).
travelFromTo(A, C) :- directTrain(A, B),
                      travelFromTo(B, C).


% Exercise 3.4. Define a predicate greater_than/2 that takes two numerals
%in the notation that we introduced in this lecture (i.e. 0, succ(0),
% succ(succ(0)) ...) as arguments and decides whether the first one is
% greater than the second one. E.g:
% ?- greater_than(succ(succ(succ(0))),succ(0)).
% yes
% ?- greater_than(succ(succ(0)),succ(succ(succ(0)))).
% no

greater_than(succ(_), 0).
greater_than(succ(X), succ(Y)) :-
  greater_than(X, Y).

% How I think this works. The first rule is the base case, and matches
% succ(_), where _ is the disposable variable, as the first argument and
% 0 as the second argument. In that case it evaluates to true, the first
% argument is greater than the second one. If there is no match for the
% first rule, the second rule is attempted. It matches succ(X) and succ(Y)
% assigning whats inside succ() to X and Y respectively, and then tries to
% resolve X and Y again. Eventually either X or Y will be stripped of all
% their wrapping succ(). If X still has at least 1 succ() and Y is 0, we
% know that X is greater. So:
%       ?- greater_than(succ(succ(qwe(99))), succ(0)).
%       true.
