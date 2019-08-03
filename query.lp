#include "general.lp".
target_feature(conjunction).
% this is the input for the file
% target_feature(inverse_roles).
% target_box(empty_t_box,)

% -- figure out the DL

has_modeling_feature(X,Y):- target_dl(X), has_modeling_feature(alc,Y), modeling_feature(X).
-has_target_features(X):- description_logic(X), not has_modeling_feature(X,Y), target_feature(Y).
has_target_features(X):- description_logic(X), not -has_target_features(X).
-target_dl(X):- higher_logic(X,Y), X != Y, has_target_features(Y).
target_dl(X):- has_target_features(X), not -target_dl(X).
% -- output the dl name
#show target_dl/1.

% -- figure out the bounds

cs_lb(P):- target_dl(X), has_lowest_upper_bound(X, concept_satisfiability, B, P), target_box(B).
cs_ub(P):- target_dl(X), has_highest_lower_bound(X, concept_satisfiability, B, P), target_box(B).
ac_lb(P):- target_dl(X), has_lowest_upper_bound(X, a_box_consistency, B, P), target_box(B).
ac_ub(P):- target_dl(X), has_highest_lower_bound(X, a_box_consistency, B, P), target_box(B).
cq_lb(P):- target_dl(X), has_highest_lower_bound(X, conjunctive_query_answering, B, P), target_box(B).
cq_ub(P):- target_dl(X), has_lowest_upper_bound(X, conjunctive_query_answering, B, P), target_box(B).
fmr_lb(P):- target_dl(X), has_highest_lower_bound(X, finite_model_reasoning, B, P), target_box(B).
fmr_ub(P):- target_dl(X), has_lowest_upper_bound(X, finite_model_reasoning, B, P), target_box(B).
#show cs_lb/1.
#show cs_ub/1.
#show ac_lb/1.
#show ac_ub/1.
#show cq_lb/1.
#show cq_ub/1.
#show fmr_lb/1.
#show fmr_ub/1.

% figure out the properties
fin_model:- target_dl(X), has_model_property(X, finite_model, B, _), target_box(B).
-fin_model:- target_dl(X), -has_model_property(X, finite_model, B, _), target_box(B).
tree_model:- target_dl(X), has_model_property(X, tree_model, _).
-tree_model:- target_dl(X), -has_model_property(X, finite_model, _).
#show fin_model/0.
#show -fin_model/0.
#show tree_model/0.
#show -tree_model/0.
