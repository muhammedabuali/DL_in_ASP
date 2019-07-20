#include "general.lp".

upper_bound_cs_et(P):- has_lowest_upper_bound(alcq, concept_satisfiability, empty_t_box,P).
lower_bound_cs_et(P):- has_highest_lower_bound(alcq, concept_satisfiability, empty_t_box,P).
upper_bound_ac_et(P):- has_lowest_upper_bound(alcq, a_box_consistency, empty_t_box,P).
lower_bound_ac_et(P):- has_highest_lower_bound(alcq, a_box_consistency, empty_t_box,P).

upper_bound_cs_at(P):- has_lowest_upper_bound(alcq, concept_satisfiability, acyclic_t_box,P).
lower_bound_cs_at(P):- has_highest_lower_bound(alcq, concept_satisfiability, acyclic_t_box,P).
upper_bound_ac_at(P):- has_lowest_upper_bound(alcq, a_box_consistency, acyclic_t_box,P).
lower_bound_ac_at(P):- has_highest_lower_bound(alcq, a_box_consistency, acyclic_t_box,P).

upper_bound_cs_gt(P):- has_lowest_upper_bound(alcq, concept_satisfiability, general_t_box,P).
lower_bound_cs_gt(P):- has_highest_lower_bound(alcq, concept_satisfiability, general_t_box,P).
upper_bound_ac_gt(P):- has_lowest_upper_bound(alcq, a_box_consistency, general_t_box,P).
lower_bound_ac_gt(P):- has_highest_lower_bound(alcq, a_box_consistency, general_t_box,P).
fin_model:- has_model_property(alcq, finite_model,_).
tree_model:- has_model_property(alcq, tree_model,_).


#show fin_model/0.
#show tree_model/0.

#show.

% #show  upper_bound_cs_et/1.
% #show  lower_bound_cs_et/1.
% #show  upper_bound_ac_et/1.
% #show  lower_bound_ac_et/1.

% #show  upper_bound_cs_at/1.
% #show  lower_bound_cs_at/1.
% #show  upper_bound_ac_at/1.
% #show  lower_bound_ac_at/1.

% #show  upper_bound_cs_gt/1.
% #show  lower_bound_cs_gt/1.
% #show  upper_bound_ac_gt/1.
% #show  lower_bound_ac_gt/1.
