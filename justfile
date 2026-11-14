set default-list

deploy host="nausicaa":
    @nh os switch --hostname {{ host }} --target-host {{ host }}

boot host="nausicaa":
    @nh os boot --hostname {{ host }} --target-host {{ host }}

repl host="nausicaa":
    @nh os repl {{ host }}

clean:
    @nh clean all
