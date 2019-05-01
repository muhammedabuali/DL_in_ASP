description_logic(1..100).
description_logic(X):- alc(X).
description_logic(X):- alcq(X).

% modling features
modeling_feature(100..200).
  modeling_feature(X):- atomic_concept(X).
  modeling_feature(X):- top_concept(X).
  modeling_feature(X):- bottom_concept(X).
  modeling_feature(X):- complex_role_inclusion(X).
  modeling_feature(X):- concept_constructor(X).
  modeling_feature(X):- concept_negation(X).
  modeling_feature(X):- existential_restriction(X).
  modeling_feature(X):- disjointness(X).
  modeling_feature(X):- role_heirarchy(X).
  modeling_feature(X):- role_inverse(X).
  modeling_feature(X):- role_transitivity(X).
  modeling_feature(X):- conjunction(X).
  modeling_feature(X):- value_restriction(X).
  modeling_feature(X):- role_chain(X).
  modeling_feature(X):- role_inclusion(X).
  concept_negation(X):-  atomic_negation(X).
  existential_quantification(X):- limited_existential_restriction(X).
  concept_constructor(X):- functionality(X).
  concept_constructor(X):- nominals(X).
  concept_constructor(X):- qualified_number_restriction(X).
  qualified_number_restriction(X):- unqualified_number_restriction(X).

:- has_modeling_feature(X,A), not description_logic(X).
:- has_modeling_feature(X,A), not modeling_feature(A).

% define ALC
alc_modeling_feature(X):- atomic_concept(X).
alc_modeling_feature(X):- bottom_concept(X).
alc_modeling_feature(X):- concept_negation(X).
alc_modeling_feature(X):- existential_restriction(X).
alc_modeling_feature(X):- disjunction(X).
alc_modeling_feature(X):- conjunction(X).
alc_modeling_feature(X):- value_restriction(X).
alc_modeling_feature(X):- top_concept(X).
:- alc(X), not description_logic(X).
:- alc(X), has_modeling_feature(X,A),
           not alc_modeling_feature(A).


% define ALCO
alco_modeling_feature(X):- alc_modeling_feature(X).
alco_modeling_feature(X):- nominals(X).
:- alco(X), not description_logic(X).
:- alco(X), has_modeling_feature(X,A),
   not alco_modeling_feature(A).

% comparing logics

alco(1).
alc(1).
modeling_feature(101).
nominals(101).
has_modeling_feature(1, 101).
