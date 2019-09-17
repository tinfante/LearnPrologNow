
% Exercise 4.1 How does Prolog respond to the following queries?
%
%    [a,b,c,d]  =  [a,[b,c,d]].         => false
%    [a,b,c,d]  =  [a|[b,c,d]].         => true
%    [a,b,c,d]  =  [a,b,[c,d]].         => false
%    [a,b,c,d]  =  [a,b|[c,d]].         => true
%    [a,b,c,d]  =  [a,b,c,[d]].         => false
%    [a,b,c,d]  =  [a,b,c|[d]].         => true
%    [a,b,c,d]  =  [a,b,c,d,[]].        => false
%    [a,b,c,d]  =  [a,b,c,d|[]].        => true
%    []  =  _.                          => true
%    []  =  [_].                        => false
%    []  =  [_|[]].                     => false


% Exercise 4.2 Which of the following are syntactically correct lists?
% If the representation is correct, how many elements does the list have?
%
%    [1|[2,3,4]]                    => correct, 4.
%    [1,2,3|[]]                     => correct, 3.
%    [1|2,3,4]                      => incorrect.
%    [1|[2|[3|[4]]]]                => correct, 4.
%    [1,2,3,4|[]]                   => correct, 4.
%    [[]|[]]                        => incorrect.
%    [[1,2]|4]                      => incorrect.
%    [[1,2],[3,4]|[5,6,7]]          => correct, 3.

% Exercise 4.3 Write a predicate second(X,List) which checks whether X is
% the second element of List.

second(X, [_,X|_]).
