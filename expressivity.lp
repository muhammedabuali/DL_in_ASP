% we can express that a DL is more expressive than another
% bader_2 is prof bader slides 2 of ws2017
more_expressive(alci, alc, bader_2).
more_expressive(alcn, alc, bader_2).
more_expressive(alco, alc, bader_2).


% comparing logic expressivity
% holds if logic X has 1 or more features that Y doesn't have
has_extra_features(X,Y):- has_modeling_feature(X,A),
                          not has_modeling_feature(Y,A),
                          modeling_feature(A),
                          description_logic(X), description_logic(Y).

% holds if logic X has more feature than Y but not the other way around
higher_logic(X,Y):- has_extra_features(X,Y),
                    not has_extra_features(Y,X).
-higher_logic(Y,X):- has_extra_features(X,Y).
% partial order rules
% reflexivity
higher_logic(X,X):- description_logic(X).
% antisymmetry
:- higher_logic(X,Y), higher_logic(Y,X), X != Y,
   description_logic(X), description_logic(Y).
% transitivity
higher_logic(X,Z):- higher_logic(X,Y), higher_logic(Y,Z),
                    description_logic(X), description_logic(Y),
                    description_logic(Z).

