
%boxes
box_type(empty_t_box).
box_type(acyclic_t_box).
box_type(general_t_box).
larger_box(general_t_box, acyclic_t_box).
larger_box(acyclic_t_box, empty_t_box).
larger_box(general_t_box, empty_t_box).
