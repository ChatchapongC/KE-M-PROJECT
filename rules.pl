:- use_module(facts,[]).

gte(X, Y):-
    number(X),number(Y) -> X>=Y.

lte(X, Y):-
    number(X), number(Y) -> X=<Y.

movie_type(TYPE, MOVIE):-
    facts:movie(MOVIE),
    facts:is_type(MOVIE,TYPE).

movie_for_age(MOVIE,AGE):-
    facts:movie_age_range_end(MOVIE,LIMIT_UPPER_AGE),
    facts:movie_age_range_start(MOVIE,LIMIT_LOWER_AGE),
    gte(AGE, LIMIT_LOWER_AGE),
    lte(AGE,LIMIT_UPPER_AGE).

movie_for_feeling(FEELING,MOVIE):-
    facts:feeling(FEELING),
    facts:feeling_to_watch(MOVIE,FEELING).

movie_for_state(STATE,MOVIE):-
    facts:state(STATE),
    facts:state_to_watch_movie(MOVIE,STATE).

movie_custom_filters(MOVIE,TYPE,AGE,FEELING,STATE,INP_TYPE,INP_AGE,INP_FEELING,INP_STATE):-
    ((INP_TYPE,movie_type(TYPE, MOVIE));not(INP_TYPE)),
    ((INP_AGE,movie_for_age(MOVIE, AGE));not(INP_AGE)),
    ((INP_FEELING,movie_for_feeling(FEELING,MOVIE));not(INP_FEELING)),
    ((INP_STATE,movie_for_state(STATE,MOVIE));not(INP_STATE)).

