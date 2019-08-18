#include "general.lp".
target_feature(conjunction).
% this is the input for the file
% target_feature(inverse_roles).
% target_box(empty_t_box).

% -- figure out the DL

has_modeling_feature(X,Y):- target_dl(X), has_modeling_feature(alc,Y), modeling_feature(X).
-has_target_features(X):- description_logic(X), not has_modeling_feature(X,Y), target_feature(Y).
has_target_features(X):- description_logic(X), not -has_target_features(X).
-target_dl(X):- higher_logic(X,Y), X != Y, has_target_features(Y).
target_dl(X):- has_target_features(X), not -target_dl(X).
% -- output the dl name
#show target_dl/1.

% -- figure out the bounds

interesting_logic(H, P, T, 1):- has_lowest_upper_bound(H, T, B, P), target_box(B).
interesting_logic(H, P, T, 0):- has_highest_lower_bound(H, T, B, P), target_box(B).
-most_interesting_logic(H,P,T, 1):- interesting_logic(H, P, T, 1), interesting_logic(H2, P, T, 1), higher_logic(H2, H), H2 != H.

-most_interesting_logic(H,P,T, 0):- interesting_logic(H, P, T, 0), interesting_logic(H2, P, T, 0), higher_logic(H, H2), H2 != H.
most_interesting_logic(H,P,T, 1):- higher_logic(H, X), target_dl(X), interesting_logic(H, P, T, 1), not -most_interesting_logic(H, P, T, 1).
most_interesting_logic(H,P,T, 0):- higher_logic(X, H), target_dl(X), interesting_logic(H, P, T, 0), not -most_interesting_logic(H, P, T, 0).

cs_ub(P,I,H):- target_dl(X), has_lowest_upper_bound(X, concept_satisfiability, B, P), target_box(B),
                has_upper_bound(X, concept_satisfiability, B, P, I),
                most_interesting_logic(H, P, concept_satisfiability, 1).


cs_ub_d(P):- target_dl(X), has_lowest_upper_bound(X, concept_satisfiability_data, B, P), target_box(B).

cs_lb(P,I, L):- target_dl(X), has_highest_lower_bound(X, concept_satisfiability, B, P), target_box(B),
           has_lower_bound(X, concept_satisfiability, B, P, I),
           most_interesting_logic(L, P, concept_satisfiability, 0).

cs_lb_d(P):- target_dl(X), has_highest_lower_bound(X, concept_satisfiability_data, B, P), target_box(B).

ac_ub(P,I, H):- target_dl(X), has_lowest_upper_bound(X, a_box_consistency, B, P), target_box(B),
             most_interesting_logic(H, P, a_box_consistency, 1),
             has_upper_bound(X, a_box_consistency, B, P, I).
ac_ub_d(P):- target_dl(X), has_lowest_upper_bound(X, a_box_consistency_data, B, P), target_box(B).

ac_lb(P,I, L):- target_dl(X), has_highest_lower_bound(X, a_box_consistency, B, P), target_box(B),
             most_interesting_logic(L, P, a_box_consistency, 0),
             has_lower_bound(X, a_box_consistency, B, P, I).
ac_lb_d(P):- target_dl(X), has_highest_lower_bound(X, a_box_consistency_data, B, P), target_box(B).

cq_ub(P):- target_dl(X), has_highest_lower_bound(X, conjunctive_query_answering, B, P), target_box(B).
cq_ub_d(P):- target_dl(X), has_highest_lower_bound(X, conjunctive_query_data, B, P), target_box(B).

cq_lb(P):- target_dl(X), has_lowest_upper_bound(X, conjunctive_query_answering, B, P), target_box(B).
cq_lb_d(P):- target_dl(X), has_lowest_upper_bound(X, conjunctive_query_data, B, P), target_box(B).

fmr_ub(P):- target_dl(X), has_highest_lower_bound(X, finite_model_reasoning, B, P), target_box(B).
fmr_ub_d(P):- target_dl(X), has_highest_lower_bound(X, finite_model_reasoning_data, B, P), target_box(B).

fmr_lb(P):- target_dl(X), has_lowest_upper_bound(X, finite_model_reasoning, B, P), target_box(B).
fmr_lb_d(P):- target_dl(X), has_lowest_upper_bound(X, finite_model_reasoning_data, B, P), target_box(B).

#show cs_lb/3.
#show cs_lb_d/1.

#show cs_ub/3.
#show cs_ub_d/1.

#show ac_lb/3.
#show ac_lb_d/1.

#show ac_ub/3.
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
fin_model:- target_dl(X), has_model_property(X, finite_model, B, _), target_box(B).
-fin_model:- target_dl(X), -has_model_property(X, finite_model, B, _), target_box(B).
tree_model:- target_dl(X), has_model_property(X, tree_model, _).
-tree_model:- target_dl(X), -has_model_property(X, finite_model, _).
#show fin_model/0.
#show -fin_model/0.
#show tree_model/0.
#show -tree_model/0.
