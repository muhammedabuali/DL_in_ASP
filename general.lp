% expressivity
#include "expressivity.lp".
% complexity
#include "complexity.lp".
% model properties
#include "model_property.lp".
% modeling features
#include "features.lp".
% logics
#include "logics.lp".
% boxes
#include "boxes.lp".
% reasoning tasks
#include "tasks.lp".
% results from the navigator
#include "navigator_data.lp".



% has_inferred_lower_bound(alcn,concept_satisfiability,general_t_box,n_exp_time_hard).

% -------- complexity results -----



% ------ reductions ------

% ----- [1] --------
% hardness for abox_consistency of a DL with negation and conjunction
% taken from Prof. Bader slides slide 1, description logic, ws2017.
% follows from hardness of concept sat.
has_lower_bound(X, a_box_consistency, B, P, 0):-
                   has_modeling_feature(X, conjunction),
                   has_modeling_feature(X, concept_negation),
                   has_lower_bound(X, concept_satisfiability, T, P, _),
                   description_logic(X), box_type(B), lower_bound(P).

% ----- [2] --------
% a more expressive box implies at least as hard as regular one.
% example hardness for acyclic tbox follows from without tbox case
has_lower_bound(X, T, B, P, 0):- has_lower_bound(X, T, B2, P, _), larger_box(B,B2).

% ----- [3] --------
% an upper bound for higher logic implies same bound at most for lower logics
has_upper_bound(X, T, B, P, 0):- has_upper_bound(X2, T, B, P, _), higher_logic(X2, X).


% ========================================

% Tests and questions

% question: find all the weakest dls available with concept negation

% required_dl(X):- description_logic(X),has_modeling_feature(X, concept_negation).
% -chosen_dl(Y):- required_dl(X), higher_logic(Y,X), required_dl(Y), X!=Y.
% chosen_dl(X):- required_dl(X), not -chosen_dl(X).
% #show chosen_dl/1.
% #show -chosen_dl/1.

% emira questions

% question 1: is alc dl contained in alcqi ?

% alc_contained_in_alcqi:- higher_logic(alcqi,alc).
% #show alc_contained_in_alcqi.
% % alternatively: assume alcqi is a new dl called x

% description_logic(x).
% has_modeling_feature(x,( atomic_concept;bottom_concept;
% concept_negation;existential_restriction;
% disjunction;conjunction;value_restriction;
% inverse_roles;
% top_concept;qualified_number_restriction )).

% alc_contained_in_alcqi:- higher_logic(x,alc).

% question 3: which logics are less expressive than S

% answer(X):- higher_logic(s,X), X != s.
% #show answer/1.

% test : has_highest_lower_bound
% add more lower bounds and check the highest is selected
% has_inferred_lower_bound(alcqi, concept_satisfiability, general_t_box, p_space_hard).
% #show has_highest_lower_bound/4.

% test is_class_complete
% has_lower_bound(alc,concept_satisfiability,general_t_box,exp_time_hard, 0).
% has_upper_bound(alc,concept_satisfiability,general_t_box, in_exp_time, 0).
% #show is_class_complete/4.

% test reductions for a_box_consistency
% has_complex(T,P):- has_lower_bound(alc, a_box_consistency, T, P, 0).
% #show has_complex/2.

% alc_lower_bound(T, B, P):- has_lower_bound(alc, T, B, P, _), reasoning_task(T), box_type(B), lower_bound(P).
% #show alc_lower_bound/3.

% #show higher_logic/2.


% show complexity for alcn
% test implied hardness for alcn
% alcn_con_sat_lb(P):- has_lower_bound(alcn, concept_satisfiability, general_t_box, P, _).
% alcn_con_sat_ub(P):- has_upper_bound(alcn, concept_satisfiability, general_t_box, P, _).
% #show alcn_con_sat_ub/1.
% #show alcn_con_sat_lb/1.


#show.
