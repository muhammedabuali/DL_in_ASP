#include "features.lp".

% logics
description_logic(alc;
                  alcq;
                  alcn;
                  alco;
                  ualc;
                  ualcf;
                  ualcn;
                  ualcq;
                  alci;
                  alci_reg;
                  alcf;
                  alcif;
                  alcif_reg;
                  alcin;
                  alciq;
                  alcoq;
                  alcon;
                  alcof;
                  alcoi;
                  alcoif;
                  alcoin;
                  alcoiq;
                  shiq;
                  shoq;
                  shoi;
                  shoiq;
                  alch;
                  r;
                  si;
                  sin;
                  s).

% define alc
has_modeling_feature(alc,( atomic_concept;bottom_concept;
                      concept_negation;existential_restriction;
                      disjunction;conjunction;value_restriction;
                      top_concept )).
% define s
has_modeling_feature(s, transitive_roles).
has_modeling_feature(s,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define si
has_modeling_feature(si, inverse_roles).
has_modeling_feature(si,X):- has_modeling_feature(s,X), modeling_feature(X).

% define sin
has_modeling_feature(sin, unqualified_number_restriction).
has_modeling_feature(sin,X):- has_modeling_feature(si,X), modeling_feature(X).

% define shoq
has_modeling_feature(shoq, ( transitive_roles; role_heirarchy )).
has_modeling_feature(shoq,X):- has_modeling_feature(alcoq,X), modeling_feature(X).

% define shoi
has_modeling_feature(shoi, ( transitive_roles; role_heirarchy )).
has_modeling_feature(shoi,X):- has_modeling_feature(alcoi,X), modeling_feature(X).

% define shoiq
has_modeling_feature(shoiq, qualified_number_restriction).
has_modeling_feature(shoiq,X):- has_modeling_feature(shoi,X), modeling_feature(X).

% define shiq
has_modeling_feature(shiq, ( transitive_roles; role_heirarchy )).
has_modeling_feature(shiq,X):- has_modeling_feature(alciq,X), modeling_feature(X).

% define r
has_modeling_feature(r, ( transitive_roles; role_heirarchy; complex_role_inclusion )).
has_modeling_feature(r,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alco
has_modeling_feature(alco,nominals).
has_modeling_feature(alco,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alcf
has_modeling_feature(alcf, functionality).
has_modeling_feature(alcf, X):- has_modeling_feature(alc,X), modeling_feature(X).

% define ualc
has_modeling_feature(ualc, least_fix_point_op).
has_modeling_feature(ualc,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define ualcf
has_modeling_feature(ualcf, functionality).
has_modeling_feature(ualcf,X):- has_modeling_feature(ualc,X), modeling_feature(X).

% define ualcn
has_modeling_feature(ualcn, unqualified_number_restriction).
has_modeling_feature(ualcn,X):- has_modeling_feature(ualc,X), modeling_feature(X).

% define ualcq
has_modeling_feature(ualcq, qualified_number_restriction).
has_modeling_feature(ualcq,X):- has_modeling_feature(ualc,X), modeling_feature(X).

% define alcq
has_modeling_feature(alcq, qualified_number_restriction).
has_modeling_feature(alcq,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alci
has_modeling_feature(alci, inverse_roles).
has_modeling_feature(alci,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alci_reg
has_reg_features(alci_reg).
has_modeling_feature(alci_reg,X):- has_modeling_feature(alci,X), modeling_feature(X).

% define alcif
has_modeling_feature(alcif, functionality).
has_modeling_feature(alcif, X):- has_modeling_feature(alci,X), modeling_feature(X).


% define alcif_reg
has_modeling_feature(X, role_union):- has_reg_features(X).
has_modeling_feature(X, role_chain):- has_reg_features(X).
has_modeling_feature(X, reflexive_transitive_closure):- has_reg_features(X).
has_modeling_feature(X, concept_identity):- has_reg_features(X).
has_reg_features(alcif_reg).
has_modeling_feature(alcif_reg,X):- has_modeling_feature(alcif,X), modeling_feature(X).

% define alcoq
has_modeling_feature(alcoq, (qualified_number_restriction;nominals)).
has_modeling_feature(alcoq,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alcoi
has_modeling_feature(alcoi, (inverse_roles ;nominals)).
has_modeling_feature(alcoi,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alcoif
has_modeling_feature(alcoif, functionality).
has_modeling_feature(alcoif,X):- has_modeling_feature(alcoi,X), modeling_feature(X).

% define alcoin
has_modeling_feature(alcoin, unqualified_number_restriction).
has_modeling_feature(alcoin,X):- has_modeling_feature(alcoi,X), modeling_feature(X).

% define alcoiq
has_modeling_feature(alcoiq, qualified_number_restriction).
has_modeling_feature(alcoiq,X):- has_modeling_feature(alcoi,X), modeling_feature(X).

% define alcn
has_modeling_feature(alcn, unqualified_number_restriction).
has_modeling_feature(alcn,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alcinQi
has_modeling_feature(alcin, inverse_roles).
has_modeling_feature(alcin,X):- has_modeling_feature(alcn,X), modeling_feature(X).

% define alch
has_modeling_feature(alch, role_heirarchy).
has_modeling_feature(alcn,X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alciq
has_modeling_feature(alciq, ( qualified_number_restriction;inverse_roles )).
has_modeling_feature(alciq, X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alcon
has_modeling_feature(alcon, ( unqualified_number_restriction;nominals )).
has_modeling_feature(alcon, X):- has_modeling_feature(alc,X), modeling_feature(X).

% define alcof
has_modeling_feature(alcof, ( functionality;nominals )).
has_modeling_feature(alcof, X):- has_modeling_feature(alc,X), modeling_feature(X).
