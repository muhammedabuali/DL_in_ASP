% logics
#include "logics.lp".
% expressivity
#include "expressivity.lp".

% complexities
complexity_class(p_time;
  n_p_time;
  co_n_p_time;
  p_space;
  exp_time;
  n_exp_time;
  exp_exp_time;
  un_decidable).

% relationship between classes
lower_upper_bound(p_time , p_space).
lower_upper_bound(p_space , exp_time).
lower_upper_bound(exp_time, n_exp_time).
lower_upper_bound(n_exp_time, un_decidable).


higher_lower_bound( p_space , p_time).
higher_lower_bound(exp_time ,p_space).
higher_lower_bound(n_exp_time ,exp_time).
higher_lower_bound(un_decidable ,n_exp_time).

% complete classes

-has_highest_lower_bound(X,T,B,C1):- has_lower_bound(X,T,B,C1, _),
                                      has_lower_bound(X,T,B,D1, _),
                                      higher_lower_bound(D1,C1), C1 != D1.

has_highest_lower_bound(X,T,B,C1):- has_lower_bound(X,T,B,C1, _),
                                    not -has_highest_lower_bound(X,T,B,C1),
                                    description_logic(X), reasoning_task(T),
                                    box_type(B), complexity_class(C1).

-has_lowest_upper_bound(X,T,B,C1):- has_upper_bound(X,T,B,C1, _),
                                     has_upper_bound(X,T,B,D1, _),
                                     lower_upper_bound(D1,C1), C1 != D1.

has_lowest_upper_bound(X,T,B,C1):- has_upper_bound(X,T,B,C1, _),
                                    not -has_lowest_upper_bound(X,T,B,C1),
                                    description_logic(X), reasoning_task(T),
                                    box_type(B), complexity_class(C1).


% partial order rules
% reflexivity
lower_upper_bound(X,X):- complexity_class(X).
% antisymmetry
:- lower_upper_bound(X,Y), lower_upper_bound(Y,X), X != Y,
   complexity_class(X), complexity_class(Y).
% transitivity -- needed
lower_upper_bound(X,Z):- lower_upper_bound(X,Y), lower_upper_bound(Y,Z),
                         complexity_class(X), complexity_class(Y),
                         complexity_class(Z).


% partial order rules
% reflexivity
higher_lower_bound(X,X):- complexity_class(X).
% antisymmetry
:- higher_lower_bound(X,Y), higher_lower_bound(Y,X), X != Y,
   complexity_class(X), complexity_class(Y).
% transitivity
higher_lower_bound(X,Z):- higher_lower_bound(X,Y), higher_lower_bound(Y,Z),
                          complexity_class(X), complexity_class(Y),
                          complexity_class(Z).

is_class_complete(X,T,B,C):- has_lower_bound(X,T,B,C, _),
                             has_upper_bound(X,T,B,C, _),
                             description_logic(X), reasoning_task(T),
                             box_type(B).
has_lower_bound(X,T,B,C,I):-
        has_complexity(X, T, B, C, I).

has_upper_bound(X,T,B,C,I):-
        has_complexity(X, T, B, C, I).

has_complexity(alci, conjunctive_query_answering, B, exp_exp_time, 0):-
                     box_type(B).

% wrong data
has_complexity(alci, finite_model_reasoning, B, exp_exp_time, 0):-
                     box_type(B).
