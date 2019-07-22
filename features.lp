% features
modeling_feature(atomic_concept;
  top_concept;
  bottom_concept;
  concept_negation;
  concept_constructor;
  conjunction;disjunction;
  atomic_negation;nominals;
  inverse_roles;transitive_roles;
  functionality;least_fix_point_op;
  role_heirarchy;complex_role_inclusion;
  value_restriction;existential_restriction;
  role_intersection; role_union; role_complement;
  role_chain; reflexive_transitive_closure;
  concept_identity
).

% sub features
sub_modeling_feature(( nominals ; qualified_number_restriction;
                       functionality; unqualified_number_restriction;
                       least_fix_point_op),
                       concept_constructor).
sub_modeling_feature( unqualified_number_restriction,qualified_number_restriction).


% transitivity of submodeling feature
sub_modeling_feature(X,Z):- sub_modeling_feature(X,Y),sub_modeling_feature(Y,Z).
% a sub modeling feature is a modeling feature
modeling_feature(X):- sub_modeling_feature(X,Y), modeling_feature(Y).
modeling_feature(X):- sub_modeling_feature(Y,X), modeling_feature(Y).
% a model with a feature has its sub modeling features
has_modeling_feature(X,A):- has_modeling_feature(X,B), sub_modeling_feature(A,B).
