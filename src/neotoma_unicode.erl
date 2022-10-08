-module(neotoma_unicode).
-author("Luke Bakken <lukerbakken@gmail.com>").

-export([characters_to_list/1, characters_to_binary/1]).

-spec characters_to_list(Data) -> Result when
      Data :: unicode:latin1_chardata() | unicode:chardata() | unicode:external_chardata(),
      Result :: list()
              | {error, list(), RestData}
              | {incomplete, list(), binary()},
      RestData :: unicode:latin1_chardata() | unicode:chardata() | unicode:external_chardata().
characters_to_list(Data) ->
    case unicode:characters_to_list(Data) of
        {error, _, _}=Error ->
            throw({unicode_error, Error});
        {incomplete, _, _}=Error ->
            throw({unicode_error, Error});
        Result when is_list(Result) ->
            Result
    end.

-spec characters_to_binary(Data) -> Result when
      Data :: unicode:latin1_chardata() | unicode:chardata() | unicode:external_chardata(),
      Result :: binary()
              | {error, binary(), RestData}
              | {incomplete, binary(), binary()},
      RestData :: unicode:latin1_chardata() | unicode:chardata() | unicode:external_chardata().
characters_to_binary(Data) ->
    case unicode:characters_to_binary(Data) of
        {error, _, _}=Error ->
            throw({unicode_error, Error});
        {incomplete, _, _}=Error ->
            throw({unicode_error, Error});
        Result when is_binary(Result) ->
            Result
    end.
