% logics
description_logic(alc;
                  alcq;
                  alcn;
                  alco;
                  alcqi;
                  s).
% features
modeling_feature(atomic_concept;
                  top_concept;
                  bottom_concept;
                  concept_negation;
                  concept_constructor;
                  conjunction;disjunction;
                  atomic_negation;nominals;
                  inverse_roles;transitive_roles;
                  value_restriction;existential_restriction).

%sub features
sub_modeling_feature(( nominals ; qualified_number_restriction),concept_constructor).
sub_modeling_feature( unqualified_number_restriction,qualified_number_restriction).
% transitivity
sub_modeling_feature(X,Z):- sub_modeling_feature(X,Y),sub_modeling_feature(Y,Z).

modeling_feature(X):- sub_modeling_feature(X,Y), modeling_feature(Y).
modeling_feature(X):- sub_modeling_feature(Y,X), modeling_feature(Y).
has_modeling_feature(X,A):- has_modeling_feature(X,B), sub_modeling_feature(A,B).

% define alc
has_modeling_feature(alc,( atomic_concept;bottom_concept;
                      concept_negation;existential_restriction;
                      disjunction;conjunction;value_restriction;
                      top_concept )).
% define alc
has_modeling_feature(s,( atomic_concept;bottom_concept;
                      concept_negation;existential_restriction;
                      disjunction;conjunction;value_restriction;
                      transitive_roles;
                      top_concept )).

% define alco
has_modeling_feature(alco,( atomic_concept;bottom_concept;
concept_negation;existential_restriction;
disjunction;conjunction;value_restriction;
top_concept;nominals )).

% define alcq
has_modeling_feature(alcq,( atomic_concept;bottom_concept;
concept_negation;existential_restriction;
disjunction;conjunction;value_restriction;
top_concept;qualified_number_restriction )).

% define alcn
has_modeling_feature(alcn,( atomic_concept;bottom_concept;
concept_negation;existential_restriction;
disjunction;conjunction;value_restriction;
top_concept;unqualified_number_restriction )).

% define alcqi
has_modeling_feature(alcqi,( atomic_concept;bottom_concept;
concept_negation;existential_restriction;
disjunction;conjunction;value_restriction;
inverse_roles;
top_concept;qualified_number_restriction )).

% comparing logic expressivity
has_extra_features(X,Y):- has_modeling_feature(X,A),
                    not has_modeling_feature(Y,A),
                    modeling_feature(A),
                    description_logic(X), description_logic(Y).

higher_logic(X,Y):- has_extra_features(X,Y),
                    not has_extra_features(Y,X).
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

% complexities
upper_bound(in_p_time;
            in_p_space;
            in_exp_time).

% relationship between classes
lower_upper_bound(in_p_time , in_p_space).
lower_upper_bound(in_p_space , in_exp_time).
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

% lower bounds
lower_bound(p_time_hard;
            p_space_hard;
            exp_time_hard;
            n_exp_time_hard
            ).

higher_lower_bound( p_space_hard , p_time_hard).
higher_lower_bound(exp_time_hard ,p_space_hard).
higher_lower_bound(n_exp_time_hard ,exp_time_hard).

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

% complete classes
% represents which higher and lower bounds are of the smae class
same_class(in_p_time, p_time_hard, p_time).
same_class(in_p_space, p_space_hard, p_space).
same_class(in_exp_time, exp_time_hard, exp_time).
is_class_complete(X,T,B,C):- has_lower_bound(X,T,B,C2),
                              has_upper_bound(X,T,B,C1),
                              same_class(C1,C2,C),
                              description_logic(X), reasoning_task(T),
                              box_type(B).
%boxes
box_type(general_t_box).
% reasoning_tasks
reasoning_task(a_box_consistency;
               concept_satisfiability).

% known complexities
has_lower_bound(alc,concept_satisfiability,general_t_box,exp_time_hard).
has_upper_bound(alc,concept_satisfiability,general_t_box,exp_time).
% has_inferred_lower_bound(alcn,concept_satisfiability,general_t_box,n_exp_time_hard).
% inferred_complexities
has_inferred_lower_bound(Y,T,B,C1):- has_lower_bound(X,T,B,C1), higher_logic(Y,X),
                                        % Domains
                                        description_logic(X), description_logic(Y),
                                        reasoning_task(T), box_type(B), lower_bound(C1).

-has_highest_lower_bound(X,T,B,C1):- has_inferred_lower_bound(X,T,B,C1),
                                      has_inferred_lower_bound(X,T,B,D1),
                                      higher_lower_bound(D1,C1), C1 != D1.

has_highest_lower_bound(X,T,B,C1):- has_inferred_lower_bound(X,T,B,C1),
                                    not -has_highest_lower_bound(X,T,B,C1),
                                    description_logic(X), reasoning_task(T),
                                    box_type(B), lower_bound(C1).

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
% has_lower_bound(alc,concept_satisfiability,general_t_box,exp_time_hard).
% has_upper_bound(alc,concept_satisfiability,general_t_box, in_exp_time).
% #show is_class_complete/4.

#show .
