description_logic(alc;
                  alco).
modeling_feature(atomic_concept;
                  top_concept;
                  bottom_concept;
                  concept_negation;
                  concept_constructor;
                  conjunction;disjunction;
                  atomic_negation;nominals;
                  value_restriction;existential_restriction).

has_modeling_feature(alc,( atomic_concept;bottom_concept;
                      concept_negation;existential_restriction;
                      disjunction;conjunction;value_restriction;
                      top_concept )).

has_modeling_feature(alco,( atomic_concept;bottom_concept;
concept_negation;existential_restriction;
disjunction;conjunction;value_restriction;
top_concept;nominals )).

has_extra_features(X,Y):- has_modeling_feature(Y,A),
                    not has_modeling_feature(X,A),
                    modeling_feature(A),
                    description_logic(X),description_logic(Y).
higher_logic(X,Y):- has_extra_features(X,Y),
                    not has_extra_features(Y,X).
#show.
#show higher_logic/2.
