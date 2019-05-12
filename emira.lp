% init
  % description_logic(1..100).
  % modeling_feature(1..100).
  % box(200..210).
  % axiom(300..310).
  % model_property(400..410).
  description_logic(X):- alc(X).
  description_logic(X):- alco(X).

% modling features
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
  modeling_feature(X):- disjunction(X).
  modeling_feature(X):- value_restriction(X).
  modeling_feature(X):- role_chain(X).
  modeling_feature(X):- role_inclusion(X).
  concept_negation(X):- atomic_negation(X).
  existential_restriction(X):- limited_existential_restriction(X).
  concept_constructor(X):- functionality(X).
  concept_constructor(X):- nominals(X).
  concept_constructor(X):- qualified_number_restriction(X).
  qualified_number_restriction(X):- unqualified_number_restriction(X).
  :- has_modeling_feature(X,A), not description_logic(X).
  :- has_modeling_feature(X,A), not modeling_feature(A).

% instantiate
  atomic_concept(101).
  top_concept(102).
  bottom_concept(103).
  complex_role_inclusion(104).
  concept_constructor(105).
  concept_negation(106).
  existential_restriction(107).
  disjointness(108).
  role_heirarchy(109).
  role_inverse(110).
  role_transitivity(111).
  conjunction(112).
  value_restriction(113).
  role_chain(114).
  role_inclusion(115).
  atomic_negation(116).
  limited_existential_restriction(117).
  functionality(118).
  nominals(119).
  qualified_number_restriction(120).
  unqualified_number_restriction(121).
  disjunction(122).

% define ALC
  alc_modeling_feature(X):- atomic_concept(X).
  alc_modeling_feature(X):- bottom_concept(X).
  alc_modeling_feature(X):- concept_negation(X).
  alc_modeling_feature(X):- existential_restriction(X).
  alc_modeling_feature(X):- disjunction(X).
  alc_modeling_feature(X):- conjunction(X).
  alc_modeling_feature(X):- value_restriction(X).
  alc_modeling_feature(X):- top_concept(X).


has_modeling_feature(X,A):- alc(X), alc_modeling_feature(A).
-alc(X):- alc_modeling_feature(A), description_logic(X), not has_modeling_feature(X,A).
alc(X):- not -alc(X), description_logic(X).
% define ALCO
  alco_modeling_feature(X):- alc_modeling_feature(X).
  alco_modeling_feature(X):- nominals(X).

  has_modeling_feature(X,A):- alco(X), alco_modeling_feature(A).
  -alco(X):- alco_modeling_feature(A), description_logic(X), not has_modeling_feature(X,A).
  alco(X):- not -alco(X), description_logic(X).

% boxes
  box(X):- tbox(X).
  tbox(X):- empty_tbox(X).
  tbox(X):- acyclic_tbox(X).
  tbox(X):- general_tbox(X).
  box(X):- abox(X).
  box(X):- rbox(X).
  %disjointness
  :- abox(X), rbox(X).
  :- rbox(X), tbox(X).
  :- abox(X), tbox(X).

% axioms
  abox_axiom(X):- concept_assertion(X).
  abox_axiom(X):- role_assertion(X).
  axiom(X):- abox_axiom(X).
  axiom(X):- rbox_axiom(X).
  axiom(X):- tbox_axiom(X).
  tbox_axiom(X):- concept_definition(X).
  tbox_axiom(X):- gci(X).
  % disjointness
  :- abox_axiom(X), rbox_axiom(X).
  :- abox_axiom(X), tbox_axiom(X).
  :- tbox_axiom(X), rbox_axiom(X).

% model properties
model_property(X):- finite_model_property(X).
model_property(X):- tree_model_property(X).

% complexities
  reasoning_task(X):- abox_consistency(X).
  reasoning_task(X):- concept_satisfiability(X).

  in_complexity_class(X):- in_exp_time(X).
  in_complexity_class(X):- in_p_space(X).
  in_exp_time(X):- in_pspace(X).
  %....
  complexity_class_hard(X):- exp_time_hard(X).
  complexity_class_hard(X):- pspace_hard(X).
  exp_time_hard(X):- p_space_hard(X).
  %....

 % DL Complexities
 % has_complexity(X,T,B,C1,C2)
 :- has_complexity(X,_,_,_,_), not description_logic(X).
 :- has_complexity(_,T,_,_,_), not reasoning_task(T).
 :- has_complexity(_,_,B,_,_), not box(B).
 :- has_complexity(_,_,_,C1,_), not in_complexity_class(C1).
 :- has_complexity(_,_,_,_,C2), not complexity_class_hard(C2).
 has_complexity(X,T,B,C1,C2):- alc(X), concept_satisfiability(T),
                           general_tbox(B), in_exp_time(C1), exp_time_hard(C2).

% testing containment
   t :- description_logic(X), alc(X), not alco(X).
   f :- description_logic(X), alco(X), not alc(X).
   alc_is_alco :- alco(X): alc(X).
   alco_is_alc :- alc(X): alco(X).
   alco(1).
   alc(2).
   #show alco/1.
   #show t/0.
   #show f/0.
   #show alc_is_alco/0.
   #show alco_is_alc/0.
   #show alc/1.

% testing logic defintion
  % description_logic(1).
  % has_modeling_feature(1, A):- alco_modeling_feature(A).
  % #show.
  % #show alc/1.
  % #show alco/1.


#show.
