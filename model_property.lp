% model properties
model_property(finite_model; tree_model).



% inferences
has_model_property(X, T, B, I):-
    has_model_property(X,T, I), description_logic(X), model_property(T),
    box_type(B).
-has_model_property(X, T, B, I):-
    -has_model_property(X,T, I), description_logic(X), model_property(T),
    box_type(B).
