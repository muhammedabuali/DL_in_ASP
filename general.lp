% expressivity
#include "expressivity.lp".
% model properties
#include "model_property.lp".
% modeling features
#include "features.lp".
% logics
#include "logics.lp".
% =========generic rules===============

% transitivity of submodeling feature
sub_modeling_feature(X,Z):- sub_modeling_feature(X,Y),sub_modeling_feature(Y,Z).
% a sub modeling feature is a modeling feature
modeling_feature(X):- sub_modeling_feature(X,Y), modeling_feature(Y).
modeling_feature(X):- sub_modeling_feature(Y,X), modeling_feature(Y).
% a model with a feature has its sub modeling features
has_modeling_feature(X,A):- has_modeling_feature(X,B), sub_modeling_feature(A,B).

% comparing logic expressivity
has_extra_features(X,Y):- has_modeling_feature(X,A),
                          not has_modeling_feature(Y,A),
                          modeling_feature(A),
                          description_logic(X), description_logic(Y).

higher_logic(X,Y):- has_extra_features(X,Y),
                    not has_extra_features(Y,X).
-higher_logic(Y,X):- has_extra_features(X,Y).
% partial order rules
% reflexivity
higher_logic(X,X):- description_logic(X).
% antisymmetry
:- higher_logic(X,Y), higher_logic(Y,X), X != Y,
   description_logic(X), description_logic(Y).
% transitivity
higher_logic(X,Z):- higher_logic(X,Y), higher_logic(Y,Z),
                    description_logic(X), description_logic(Y),
                    description_logic(Z).

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

is_class_complete(X,T,B,C):- has_lower_bound(X,T,B,C2, _),
                             has_upper_bound(X,T,B,C1, _),
                             same_class(C1,C2,C),
                             description_logic(X), reasoning_task(T),
                             box_type(B).


% =========specific rules===============



% complexities
upper_bound(in_p_time;
            in_p_space;
            in_exp_time).

% relationship between classes
lower_upper_bound(in_p_time , in_p_space).
lower_upper_bound(in_p_space , in_exp_time).

% lower bounds
lower_bound(p_time_hard;
            p_space_hard;
            exp_time_hard;
            n_exp_time_hard
            ).

higher_lower_bound( p_space_hard , p_time_hard).
higher_lower_bound(exp_time_hard ,p_space_hard).
higher_lower_bound(n_exp_time_hard ,exp_time_hard).


% complete classes
% represents which higher and lower bounds are of the smae class
same_class(in_p_time, p_time_hard, p_time).
same_class(in_p_space, p_space_hard, p_space).
same_class(in_exp_time, exp_time_hard, exp_time).

%boxes
box_type(empty_t_box).
box_type(acyclic_t_box).
box_type(general_t_box).
larger_box(general_t_box, acyclic_t_box).
larger_box(acyclic_t_box, empty_t_box).
larger_box(general_t_box, empty_t_box).

% reasoning_tasks
reasoning_task(a_box_consistency;
               concept_satisfiability).


% has_inferred_lower_bound(alcn,concept_satisfiability,general_t_box,n_exp_time_hard).
% inferred_complexities
has_lower_bound(Y,T,B,C1, 0):- has_lower_bound(X,T,B,C1, _), higher_logic(Y,X),
                            % Domains
                            description_logic(X), description_logic(Y),
                            reasoning_task(T), box_type(B), lower_bound(C1).

-has_highest_lower_bound(X,T,B,C1):- has_lower_bound(X,T,B,C1, _),
                                      has_lower_bound(X,T,B,D1, _),
                                      higher_lower_bound(D1,C1), C1 != D1.

has_highest_lower_bound(X,T,B,C1):- has_lower_bound(X,T,B,C1, _),
                                    not -has_highest_lower_bound(X,T,B,C1),
                                    description_logic(X), reasoning_task(T),
                                    box_type(B), lower_bound(C1).

% same for upper bound
has_upper_bound(Y,T,B,C1, 0):- has_upper_bound(X,T,B,C1, _), higher_logic(Y,X),
                            % Domains
                            description_logic(X), description_logic(Y),
                            reasoning_task(T), box_type(B), upper_bound(C1).

-has_lowest_upper_bound(X,T,B,C1):- has_upper_bound(X,T,B,C1, _),
                                     has_upper_bound(X,T,B,D1, _),
                                     lower_upper_bound(D1,C1), C1 != D1.

has_lowest_upper_bound(X,T,B,C1):- has_upper_bound(X,T,B,C1, _),
                                    not -has_lowest_upper_bound(X,T,B,C1),
                                    description_logic(X), reasoning_task(T),
                                    box_type(B), upper_bound(C1).

% known complexities from the navigator
has_lower_bound(alc, concept_satisfiability, empty_t_box, p_space_hard, 80).
has_upper_bound(alcq, concept_satisfiability, empty_t_box, in_p_space, 12).
has_upper_bound(alcqo, a_box_consistency, empty_t_box, in_p_space, 17).


% ALC With General t-box
has_lower_bound(alc, concept_satisfiability, general_t_box, exp_time_hard, 77).
has_upper_bound(alc, concept_satisfiability, general_t_box, exp_time_hard, 33).
has_upper_bound(shiq, a_box_consistency, general_t_box, exp_time_hard, 33).


% reductions
% hardness for abox_consistency of a DL with negation and conjunction
% taken from Prof. Bader slides slide 1, description logic, ws2017.
% follows from hardness of concept sat.
has_lower_bound(X, a_box_consistency, B, P, 0):-
                   has_modeling_feature(X, conjunction),
                   has_modeling_feature(X, concept_negation),
                   has_lower_bound(X, concept_satisfiability, T, P, _),
                   description_logic(X), box_type(B), lower_bound(P).

% a more expressive box implies at least as hard as regular one.
% example hardness for acyclic tbox follows from without tbox case
has_lower_bound(X, T, B, P, 0):- has_lower_bound(X, T, B2, P, _), larger_box(B,B2).
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
lower(X):-has_extra_features(alcqo,X).
higher(X):-has_extra_features(X,alcqo).
feature(X):-has_modeling_feature(alcqo,X).
feature_alcqi(X):-has_modeling_feature(alcqi,X).
#show higher_logic/2.
#show.
