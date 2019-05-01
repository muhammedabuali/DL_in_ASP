% defintions
modeling_feature(
  atomic_concept;
  bottom_concept;
  top_concept;
  conjunction;
  disjunction;
  concept_negation;
  existential_restriction;
  existential_quantification;
  value_restriction
).

has_modeling_feature(X,Z):- higher_logic(X,Y),has_modeling_feature(Y,Z),
                            description_logic(X), description_logic(Y),
                            modeling_feature(Z).
has_modeling_feature(X,Z):- sub_feature(Z,Y), has_modeling_feature(X,Y),
                            description_logic(X), modeling_feature(Y),
                            modeling_feature(Z).
% instances
description_logic(alc).
has_modeling_feature(alc, atomic_concept).
has_modeling_feature(alc, bottom_concept).
has_modeling_feature(alc, concept_negation).
has_modeling_feature(alc, existential_restriction).
has_modeling_feature(alc, disjunction).
has_modeling_feature(alc, conjunction).
has_modeling_feature(alc, value_restriction).
has_modeling_feature(alc, top_concept).

description_logic(alcq).
higher_logic(alcq, alc).
has_modeling_feature(alcq, existential_quantification)
