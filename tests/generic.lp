#include "general.lp".

target(ualcoi).

upper_bound_cs_et(P):- target(X), has_lowest_upper_bound(X, concept_satisfiability, empty_t_box,P).
lower_bound_cs_et(P):- target(X), has_highest_lower_bound(X, concept_satisfiability, empty_t_box,P).
upper_bound_ac_et(P):- target(X), has_lowest_upper_bound(X, a_box_consistency, empty_t_box,P).
lower_bound_ac_et(P):- target(X), has_highest_lower_bound(X, a_box_consistency, empty_t_box,P).

upper_bound_cs_at(P):- target(X), has_lowest_upper_bound(X, concept_satisfiability, acyclic_t_box,P).
lower_bound_cs_at(P):- target(X), has_highest_lower_bound(X, concept_satisfiability, acyclic_t_box,P).
upper_bound_ac_at(P):- target(X), has_lowest_upper_bound(X, a_box_consistency, acyclic_t_box,P).
lower_bound_ac_at(P):- target(X), has_highest_lower_bound(X, a_box_consistency, acyclic_t_box,P).

upper_bound_cs_gt(P):- target(X), has_lowest_upper_bound(X, concept_satisfiability, general_t_box,P).
lower_bound_cs_gt(P):- target(X), has_highest_lower_bound(X, concept_satisfiability, general_t_box,P).
upper_bound_ac_gt(P):- target(X), has_lowest_upper_bound(X, a_box_consistency, general_t_box,P).
lower_bound_ac_gt(P):- target(X), has_highest_lower_bound(X, a_box_consistency, general_t_box,P).
fin_model:- target(X), has_model_property(X, finite_model,_).
fin_model_et:- target(X), has_model_property(X, finite_model, empty_t_box, _).
fin_model_at:- target(X), has_model_property(X, finite_model, acyclic_t_box, _).
fin_model_gt:- target(X), has_model_property(X, finite_model, general_t_box, _).
-fin_model_et:- target(X), -has_model_property(X, finite_model, empty_t_box, _).
-fin_model_at:- target(X), -has_model_property(X, finite_model, acyclic_t_box, _).
-fin_model_gt:- target(X), -has_model_property(X, finite_model, general_t_box, _).

tree_model:- target(X), has_model_property(X, tree_model,_).
-tree_model:- target(X), -has_model_property(X, tree_model,_).

high(X):- target(Y), higher_logic(X, Y).

#show high/1.

#show fin_model/0.
#show tree_model/0.
#show -tree_model/0.

#show.

% #show  upper_bound_cs_et/1.
% #show  lower_bound_cs_et/1.
% #show  upper_bound_ac_et/1.
% #show  lower_bound_ac_et/1.
% #show  fin_model_et/0.
% #show  -fin_model_et/0.

% #show  upper_bound_cs_at/1.
% #show  lower_bound_cs_at/1.
% #show  upper_bound_ac_at/1.
% #show  lower_bound_ac_at/1.
% #show  fin_model_at/0.
% #show  -fin_model_at/0.

#show  upper_bound_cs_gt/1.
#show  lower_bound_cs_gt/1.
#show  upper_bound_ac_gt/1.
#show  lower_bound_ac_gt/1.
#show  fin_model_gt/0.
#show  -fin_model_gt/0.
