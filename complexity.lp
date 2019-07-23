% logics
#include "logics.lp".
% expressivity
#include "expressivity.lp".

% complexities
upper_bound(p_time;
  p_space;
  exp_time;
  n_exp_time).

% relationship between classes
lower_upper_bound(p_time , p_space).
lower_upper_bound(p_space , exp_time).
lower_upper_bound(exp_time, n_exp_time).

% lower bounds
lower_bound(p_time;
  p_space;
  exp_time;
  n_exp_time
).

higher_lower_bound( p_space , p_time).
higher_lower_bound(exp_time ,p_space).
higher_lower_bound(n_exp_time ,exp_time).

% complete classes

-has_highest_lower_bound(X,T,B,C1):- has_lower_bound(X,T,B,C1, _),
                                      has_lower_bound(X,T,B,D1, _),
                                      higher_lower_bound(D1,C1), C1 != D1.

has_highest_lower_bound(X,T,B,C1):- has_lower_bound(X,T,B,C1, _),
                                    not -has_highest_lower_bound(X,T,B,C1),
                                    description_logic(X), reasoning_task(T),
                                    box_type(B), lower_bound(C1).

-has_lowest_upper_bound(X,T,B,C1):- has_upper_bound(X,T,B,C1, _),
                                     has_upper_bound(X,T,B,D1, _),
                                     lower_upper_bound(D1,C1), C1 != D1.

has_lowest_upper_bound(X,T,B,C1):- has_upper_bound(X,T,B,C1, _),
                                    not -has_lowest_upper_bound(X,T,B,C1),
                                    description_logic(X), reasoning_task(T),
                                    box_type(B), upper_bound(C1).


% partial order rules
% reflexivity
lower_upper_bound(X,X):- upper_bound(X).
% antisymmetry
:- lower_upper_bound(X,Y), lower_upper_bound(Y,X), X != Y,
   upper_bound(X), upper_bound(Y).
% transitivity -- needed
lower_upper_bound(X,Z):- lower_upper_bound(X,Y), lower_upper_bound(Y,Z),
                         upper_bound(X), upper_bound(Y),
                         upper_bound(Z).


% partial order rules
% reflexivity
higher_lower_bound(X,X):- lower_bound(X).
% antisymmetry
:- higher_lower_bound(X,Y), higher_lower_bound(Y,X), X != Y,
   lower_bound(X), lower_bound(Y).
% transitivity
higher_lower_bound(X,Z):- higher_lower_bound(X,Y), higher_lower_bound(Y,Z),
                          lower_bound(X), lower_bound(Y),
                          lower_bound(Z).

is_class_complete(X,T,B,C):- has_lower_bound(X,T,B,C, _),
                             has_upper_bound(X,T,B,C, _),
                             description_logic(X), reasoning_task(T),
                             box_type(B).
