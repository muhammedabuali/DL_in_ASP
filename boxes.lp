
%box types
box_type(empty_t_box).
box_type(acyclic_t_box).
box_type(general_t_box).
% comparing boxes
larger_box(general_t_box, acyclic_t_box).
larger_box(acyclic_t_box, empty_t_box).
larger_box(general_t_box, empty_t_box).
% reflexivity
larger_box(X,X):- box_type(X).
