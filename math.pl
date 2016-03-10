													% MATH

add(X, Y, Result):- Result is X+Y.
substract(X, Y, Result):- Result is X-Y.
multiply(X, Y, Result):- Result is X*Y.
divide(X, Y, Result):- Result is X/Y.

power(_, 0, 1).
power(X, Power, Result):- P is Power-1, power(X, P, R), Result is X*R.
