% expressivity
% #include "expressivity.lp".
% complexity
#include "complexity.lp".
% model properties
#include "model_property.lp".
% modeling features
% #include "features.lp".
% logics
#include "logics.lp".
% boxes
#include "boxes.lp".
% reasoning tasks
#include "tasks.lp".
% known complexities from the navigator
% -- ALC

% - model properties
has_model_property(alc, finite_model, 77).
has_model_property(alc, tree_model, 77).

% empty TBOX
has_lower_bound(alc, concept_satisfiability, empty_t_box, p_space, 80).

% - acyclic TBOX
has_upper_bound(alcq, concept_satisfiability, acyclic_t_box, p_space, 12).
has_upper_bound(alcoq, a_box_consistency, acyclic_t_box, p_space, 17).


% - general TBOX
has_lower_bound(alc, concept_satisfiability, general_t_box, exp_time, 77).
has_upper_bound(alc, concept_satisfiability, general_t_box, exp_time, 33).
has_upper_bound(shiq, a_box_consistency, general_t_box, exp_time, 33).

% -- ALCN

% - model properties
% finite, derived from alcq
has_model_property(X, finite_model, 73):- higher_logic(alcq,X).
% treemodel : not listed

% - empty TBOX
has_lower_bound(alcn, concept_satisfiability, empty_t_box, p_space, 80).
has_upper_bound(alcn, concept_satisfiability, empty_t_box, p_space, 12).

% - general TBOX
has_upper_bound(shiq, concept_satisfiability, general_t_box, exp_time, 33).

% - ALCQ

% - model properties

% - ALCO
has_upper_bound(alcoq, concept_satisfiability, acyclic_t_box, p_space, 17).
has_upper_bound(shoq, concept_satisfiability, general_t_box, exp_time, 0).
has_upper_bound(alco, a_box_consistency, general_t_box, exp_time, 76).


% - uALC
has_lower_bound(ualc, concept_satisfiability, general_t_box, exp_time, 30).
has_upper_bound(ualc, concept_satisfiability, general_t_box, exp_time, 30).
has_model_property(ualc, finite_model, 57).
has_model_property(ualc, finite_model, 81).


% ALCI
has_upper_bound(alci, concept_satisfiability, acyclic_t_box, p_space, 12).
has_upper_bound(alci, a_box_consistency, empty_t_box, p_space, 32).

has_upper_bound(si, concept_satisfiability, acyclic_t_box, p_space, 16).
has_upper_bound(alci, a_box_consistency, acyclic_t_box, p_space, 32).

% ALCF

% ALCIF
has_upper_bound(alciq, concept_satisfiability, empty_t_box, p_space, 12).
has_upper_bound(alcif, a_box_consistency, empty_t_box, p_space, 32).
has_upper_bound(alcif, a_box_consistency, acyclic_t_box, p_space, 32).
-has_model_property(alcif, finite_model, general_t_box, 2).

% ALCIN
has_upper_bound(alcin, a_box_consistency, acyclic_t_box, p_space, 32).
-has_model_property(alcin, finite_model, general_t_box, 2).

% AlCIQ
has_upper_bound(alciq, a_box_consistency, acyclic_t_box, p_space, 32).
-has_model_property(alciq, finite_model, general_t_box, 2).

% ALCOI
has_upper_bound(shoi, a_box_consistency, general_t_box, exp_time, 33).

% ALCOQ
has_upper_bound(alcoq, a_box_consistency, empty_t_box, p_space, 76).
has_upper_bound(alcoq, a_box_consistency, general_t_box, exp_time, 76).

% ALCOIF
has_lower_bound(alcoif, concept_satisfiability, empty_t_box, n_exp_time, 82).
has_upper_bound(shoiq, concept_satisfiability, empty_t_box, n_exp_time, 12).
-has_model_property(alcoif, finite_model,  2).
% ALCOIN
-has_model_property(alcoin, finite_model,  2).
% ALCOIQ
-has_model_property(alcoiq, finite_model,  2).
has_upper_bound(alcoiq, a_box_consistency, empty_t_box, n_exp_time, 76).

% ualc
has_upper_bound(ualc, concept_satisfiability, empty_t_box, exp_time, 30).
has_lower_bound(ualc, concept_satisfiability, empty_t_box, exp_time, 30).
has_model_property(ualc, finite_model, 57).
has_model_property(ualc, tree_model, 81).

% ualcf
has_upper_bound(ualcf, concept_satisfiability, empty_t_box, exp_time, 30).
% ualcn
has_upper_bound(ualcn, concept_satisfiability, empty_t_box, exp_time, 30).
% ualcq
has_upper_bound(ualcq, concept_satisfiability, empty_t_box, exp_time, 30).
%ualcif
has_upper_bound(ualciq, concept_satisfiability, empty_t_box, exp_time, 24).
%ualco
has_upper_bound(ualcoi, concept_satisfiability, empty_t_box, exp_time, 75).
has_upper_bound(ualco, a_box_consistency, empty_t_box, exp_time, 76).
-has_model_property(ualco, tree_model, 75).
%ualcof
has_upper_bound(ualcoq, concept_satisfiability, empty_t_box, exp_time, 21).
%ualcoif
has_complexity(ualcoif, concept_satisfiability, empty_t_box, un_decidable, 20).
-has_model_property(ualcoif, finite_model, 2).
