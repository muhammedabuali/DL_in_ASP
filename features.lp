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
value_restriction;existential_restriction).

%sub features
sub_modeling_feature(( nominals ; qualified_number_restriction;
                       functionality; unqualified_number_restriction;
                       least_fix_point_op),
                       concept_constructor).
sub_modeling_feature( unqualified_number_restriction,qualified_number_restriction).
