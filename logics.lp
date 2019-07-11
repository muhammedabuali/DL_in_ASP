#include "features.lp".

% logics
description_logic(alc;
                  alcq;
                  alcn;
                  alco;
                  alci;
                  alcqi;
                  alcqo;
                  alch;
                  r;
                  s).

% define alc
has_modeling_feature(alc,( atomic_concept;bottom_concept;
                      concept_negation;existential_restriction;
                      disjunction;conjunction;value_restriction;
                      top_concept )).
% define s
has_modeling_feature(s, transitive_roles).
has_modeling_feature(s,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define r
has_modeling_feature(r, ( transitive_roles; role_heirarchy; complex_role_inclusion )).
has_modeling_feature(r,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alco
has_modeling_feature(alco,nominals).
has_modeling_feature(alco,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alcq
has_modeling_feature(alcq, qualified_number_restriction).
has_modeling_feature(alcq,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alci
has_modeling_feature(alci, inverse_roles).
has_modeling_feature(alci,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alcqo
has_modeling_feature(alcqo, (qualified_number_restriction;nominals)).
has_modeling_feature(alcqo,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alcn
has_modeling_feature(alcn, unqualified_number_restriction).
has_modeling_feature(alcn,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alch
has_modeling_feature(alch, role_heirarchy).
has_modeling_feature(alcn,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alcqi
has_modeling_feature(alcqi, ( qualified_number_restriction;inverse_roles )).
has_modeling_feature(alcqi, X):- has_modeling_feature(alc,X), modeling_feature(X).
