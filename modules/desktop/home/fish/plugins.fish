echo "Installing Fisher plugin manager"
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher &&

echo "Checking if Fisher is installed"
if type -q fisher
    echo "Installing plugins"
    fisher install IlanCosman/tide@v6
    fisher install nickeb96/puffer-fish
    fisher install meaningful-ooo/sponge
    fisher install jorgebucaran/autopair.fish
    fisher install franciscolourenco/done
else
    echo "Fisher is not installed"
end

echo "All done!"
