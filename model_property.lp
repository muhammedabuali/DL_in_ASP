% model properties
model_property(finite_model; tree_model).



% adding box type as a dimension to decide the model property
has_model_property(X, T, B, I):-
    has_model_property(X,T, I), description_logic(X), model_property(T),
    box_type(B).
-has_model_property(X, T, B, I):-
    -has_model_property(X,T, I), description_logic(X), model_property(T),
    box_type(B).
