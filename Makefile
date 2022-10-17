.PHONY: bootstrap compile clean dialyzer escript extra test

all: compile

compile:
	rebar3 compile

test:
	rebar3 eunit

clean:
	rebar3 clean

neotoma.plt:
	dialyzer --build_plt --apps erts kernel stdlib compiler crypto hipe syntax_tools --output_plt neotoma.plt

dialyzer: compile neotoma.plt
	dialyzer --plt neotoma.plt ebin

xref: compile
	rebar3 xref skip_deps=true

bootstrap: compile
	erl -pz $(CURDIR)/_build/default/lib/neotoma/ebin -b no_dot_erlang -noinput -s neotoma make_bootstrap
	rebar3 compile

extra: compile
	erl -pz $(CURDIR)/_build/default/lib/neotoma/ebin -b no_dot_erlang -noinput -s neotoma make_extra

escript:
	rebar3 escriptize
