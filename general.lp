% logics
description_logic(alc;
                  alcq;
                  alcn;
                  alco).
% features
modeling_feature(atomic_concept;
                  top_concept;
                  bottom_concept;
                  concept_negation;
                  concept_constructor;
                  conjunction;disjunction;
                  atomic_negation;nominals;
                  value_restriction;existential_restriction).

%sub features
sub_modeling_feature(( nominals ; qualified_number_restriction),concept_constructor).
sub_modeling_feature( unqualified_number_restriction,qualified_number_restriction).
% transitivity
sub_modeling_feature(X,Z):- sub_modeling_feature(X,Y),sub_modeling_feature(Y,Z).

modeling_feature(X):- sub_modeling_feature(X,Y), modeling_feature(Y).
modeling_feature(X):- sub_modeling_feature(Y,X), modeling_feature(Y).
has_modeling_feature(X,A):- has_modeling_feature(X,B), sub_modeling_feature(A,B).

has_modeling_feature(alc,( atomic_concept;bottom_concept;
                      concept_negation;existential_restriction;
                      disjunction;conjunction;value_restriction;
                      top_concept )).

has_modeling_feature(alco,( atomic_concept;bottom_concept;
concept_negation;existential_restriction;
disjunction;conjunction;value_restriction;
top_concept;nominals )).

has_modeling_feature(alcq,( atomic_concept;bottom_concept;
concept_negation;existential_restriction;
disjunction;conjunction;value_restriction;
top_concept;qualified_number_restriction )).

has_modeling_feature(alcn,( atomic_concept;bottom_concept;
concept_negation;existential_restriction;
disjunction;conjunction;value_restriction;
top_concept;unqualified_number_restriction )).

% comparing logic expressivity
has_extra_features(X,Y):- has_modeling_feature(X,A),
                    not has_modeling_feature(Y,A),
                    modeling_feature(A),
                    description_logic(X),description_logic(Y).

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
complexity_class(p_time;
                 exp_time;
                 p_space).

higher_class(exp_time, p_time).
higher_class(p_space, exp_time).

% partial order rules
% reflexivity
higher_class(X,X):- complexity_class(X).
% antisymmetry
:- higher_class(X,Y), higher_class(Y,X), X != Y,
complexity_class(X), complexity_class(Y).
% transitivity
higher_class(X,Z):- higher_class(X,Y), higher_class(Y,Z),
complexity_class(X), complexity_class(Y),
complexity_class(Z).


%boxes
box_type(general_t_box).
% reasoning_tasks
reasoning_task(a_box_consistency;
               concept_satisfiability).

% known complexities
has_complexity(alc,concept_satisfiability,general_t_box,exp_time,exp_time).
% inferred_complexities
has_inferred_complexity(Y,T,B,C1,C2):- has_complexity(X,T,B,C1,C2), higher_logic(Y,X),
                                       not has_complexity(Y,T,B,C1,C2),
                                       description_logic(X), description_logic(Y),
                                       reasoning_task(T), box_type(B), complexity_class(C1),
                                       complexity_class(C2).


% output
#show .
#show has_feature/2.
#show high_logic/2.
