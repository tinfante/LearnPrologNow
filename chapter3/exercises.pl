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
