set default-list

deploy host="nausicaa":
    @nh os switch --hostname {{ host }} --target-host {{ host }} --elevation-strategy passwordless

boot host="nausicaa":
    @nh os boot --hostname {{ host }} --target-host {{ host }} --elevation-strategy passwordless

repl host="nausicaa":
    @nh os repl --hostname {{ host }}

clean:
    @nh clean all
