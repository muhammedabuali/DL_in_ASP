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

% - empty TBOX
has_lower_bound(alc, concept_satisfiability, empty_t_box, p_space, 80).
has_upper_bound(alcq, concept_satisfiability, empty_t_box, p_space, 12).
has_upper_bound(alcqo, a_box_consistency, empty_t_box, p_space, 17).


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
% has_lower_bound(alco, concept_satisfiability, empty_t_box, )
