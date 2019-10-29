#include "general.lp".
target_feature(conjunction).
% this is the input for the file
% target_feature(inverse_roles).
% target_box(empty_t_box).
% reasoning(normal).

% -- figure out the DL

has_modeling_feature(X,Y):- target_dl(X), has_modeling_feature(alc,Y), modeling_feature(X).
-has_target_features(X):- description_logic(X), not has_modeling_feature(X,Y), target_feature(Y).
has_target_features(X):- description_logic(X), not -has_target_features(X).
-target_dl(X):- higher_logic(X,Y), X != Y, has_target_features(Y).
target_dl(X):- has_target_features(X), not -target_dl(X).
% -- output the dl name
#show target_dl/1.

% -- figure out the bounds

interesting_logic(H, P, T, 1, F):- has_lowest_upper_bound(H, T, B, P, F), reasoning(F), target_box(B).
interesting_logic(H, P, T, 0, F):- has_highest_lower_bound(H, T, B, P, F), reasoning(F), target_box(B).
-most_interesting_logic(H,P,T, 1, F):- interesting_logic(H, P, T, 1, F), reasoning(F), interesting_logic(H2, P, T, 1, F), higher_logic(H2, H), H2 != H.

-most_interesting_logic(H,P,T, 0, F):- interesting_logic(H, P, T, 0, F), reasoning(F), interesting_logic(H2, P, T, 0, F), higher_logic(H, H2), H2 != H.
most_interesting_logic(H,P,T, 1, F):- higher_logic(H, X), target_dl(X), reasoning(F), interesting_logic(H, P, T, 1, F), not -most_interesting_logic(H, P, T, 1, F).
most_interesting_logic(H,P,T, 0, F):- higher_logic(X, H), target_dl(X), reasoning(F), interesting_logic(H, P, T, 0, F), not -most_interesting_logic(H, P, T, 0, F).

cs_ub(P,I,H, F):- target_dl(X), has_lowest_upper_bound(X, concept_satisfiability, B, P, F), reasoning(F), target_box(B),
                has_upper_bound(X, concept_satisfiability, B, P, I, F),
                most_interesting_logic(H, P, concept_satisfiability, 1, F).


cs_ub_d(P, F):- target_dl(X), has_lowest_upper_bound(X, concept_satisfiability_data, B, P, F), reasoning(F), target_box(B).

cs_lb(P,I, L, F):- target_dl(X), has_highest_lower_bound(X, concept_satisfiability, B, P, F), reasoning(F), target_box(B),
           has_lower_bound(X, concept_satisfiability, B, P, I, F),
           most_interesting_logic(L, P, concept_satisfiability, 0, F).

cs_lb_d(P, F):- target_dl(X), has_highest_lower_bound(X, concept_satisfiability_data, B, P, F), reasoning(F), target_box(B).

ac_ub(P,I, H, F):- target_dl(X), has_lowest_upper_bound(X, a_box_consistency, B, P, F), reasoning(F), target_box(B),
             most_interesting_logic(H, P, a_box_consistency, 1, F),
             has_upper_bound(X, a_box_consistency, B, P, I, F).
ac_ub_d(P, F):- target_dl(X), has_lowest_upper_bound(X, a_box_consistency_data, B, P, F), reasoning(F), target_box(B).

ac_lb(P,I, L, F):- target_dl(X), has_highest_lower_bound(X, a_box_consistency, B, P, F), reasoning(F), target_box(B),
             most_interesting_logic(L, P, a_box_consistency, 0, F),
             has_lower_bound(X, a_box_consistency, B, P, I, F).
ac_lb_d(P, F):- target_dl(X), has_highest_lower_bound(X, a_box_consistency_data, B, P, F), reasoning(F), target_box(B).

cq_ub(P, F):- target_dl(X), has_highest_lower_bound(X, conjunctive_query_answering, B, P, F), reasoning(F), target_box(B).
cq_ub_d(P, F):- target_dl(X), has_highest_lower_bound(X, conjunctive_query_data, B, P, F), reasoning(F), target_box(B).

cq_lb(P, F):- target_dl(X), has_lowest_upper_bound(X, conjunctive_query_answering, B, P, F),reasoning(F), target_box(B).
cq_lb_d(P, F):- target_dl(X), has_lowest_upper_bound(X, conjunctive_query_data, B, P, F),reasoning(F), target_box(B).


#show cs_lb/4.
#show cs_lb_d/2.

#show cs_ub/4.
#show cs_ub_d/2.

#show ac_lb/4.
#show ac_lb_d/2.

#show ac_ub/4.
#show ac_ub_d/2.

#show cq_lb/2.
#show cq_lb_d/2.

#show cq_ub/2.
#show cq_ub_d/2.

#show fmr_lb/2.
#show fmr_lb_d/2.

#show fmr_ub/2.
#show fmr_ub_d/2.


% figure out the properties
fin_model:- target_dl(X), has_model_property(X, finite_model, B, _), target_box(B).
-fin_model:- target_dl(X), -has_model_property(X, finite_model, B, _), target_box(B).
tree_model:- target_dl(X), has_model_property(X, tree_model, _).
-tree_model:- target_dl(X), -has_model_property(X, finite_model, _).
#show fin_model/0.
#show -fin_model/0.
#show tree_model/0.
#show -tree_model/0.
