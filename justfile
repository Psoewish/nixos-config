set default-list

switch mode="switch":
    @nh os {{ mode }}

deploy mode="switch" host="mononoke":
    @nh os {{ mode }} --hostname {{ host }} --target-host {{ host }} --elevation-strategy passwordless

repl host="nausicaa":
    @nh os repl --hostname {{ host }}

clean:
    @nh clean all
