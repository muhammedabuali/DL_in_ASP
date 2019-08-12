#include "general.lp".

% we can figure the DL properties without knowing its name if it is not recorded in
% our knowledge base
% target_box(empty_t_box,)
description_logic(x).

has_modeling_feature(x,Y):-  has_modeling_feature(alc,Y), modeling_feature(Y).
has_modeling_feature(x,Y):-  target_feature(Y).


cs_lb(P):-  has_lowest_upper_bound(x, concept_satisfiability, B, P), target_box(B).
cs_lb_d(P):-  has_lowest_upper_bound(x, concept_satisfiability_data, B, P), target_box(B).

cs_ub(P):-  has_highest_lower_bound(x, concept_satisfiability, B, P), target_box(B).
cs_ub_d(P):-  has_highest_lower_bound(x, concept_satisfiability_data, B, P), target_box(B).

cs_ub(P):-  has_highest_lower_bound(x, concept_satisfiability, B, P), target_box(B).
cs_ub_d(P):-  has_highest_lower_bound(x, concept_satisfiability_data, B, P), target_box(B).

ac_lb(P):-  has_lowest_upper_bound(x, a_box_consistency, B, P), target_box(B).
ac_lb_d(P):-  has_lowest_upper_bound(x, a_box_consistency_data, B, P), target_box(B).

ac_ub(P):-  has_highest_lower_bound(x, a_box_consistency, B, P), target_box(B).
ac_ub_d(P):-  has_highest_lower_bound(x, a_box_consistency_data, B, P), target_box(B).

cq_lb(P):-  has_highest_lower_bound(x, conjunctive_query_answering, B, P), target_box(B).
cq_lb_d(P):-  has_highest_lower_bound(x, conjunctive_query_data, B, P), target_box(B).

cq_ub(P):-  has_lowest_upper_bound(x, conjunctive_query_answering, B, P), target_box(B).
cq_ub_d(P):-  has_lowest_upper_bound(x, conjunctive_query_data, B, P), target_box(B).

fmr_lb(P):-  has_highest_lower_bound(x, finite_model_reasoning, B, P), target_box(B).
fmr_lb_d(P):-  has_highest_lower_bound(x, finite_model_reasoning_data, B, P), target_box(B).

fmr_ub(P):-  has_lowest_upper_bound(x, finite_model_reasoning, B, P), target_box(B).
fmr_ub_d(P):-  has_lowest_upper_bound(x, finite_model_reasoning_data, B, P), target_box(B).

#show cs_lb/1.
#show cs_lb_d/1.

#show cs_ub/1.
#show cs_ub_d/1.

#show ac_lb/1.
#show ac_lb_d/1.

#show ac_ub/1.
#show ac_ub_d/1.

#show cq_lb/1.
#show cq_lb_d/1.

#show cq_ub/1.
#show cq_ub_d/1.

#show fmr_lb/1.
#show fmr_lb_d/1.

#show fmr_ub/1.
#show fmr_ub_d/1.


% figure out the properties
fin_model:-  has_model_property(x, finite_model, B, _), target_box(B).
-fin_model:-  -has_model_property(x, finite_model, B, _), target_box(B).
tree_model:-  has_model_property(x, tree_model, _).
-tree_model:-  -has_model_property(x, finite_model, _).
#show fin_model/0.
#show -fin_model/0.
#show tree_model/0.
#show -tree_model/0.
