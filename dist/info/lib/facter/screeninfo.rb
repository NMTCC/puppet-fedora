Facter.add("screencount") do
  confine :operatingsystem => "Fedora"

  setcode do
    `DISPLAY=:0 xrandr | grep -E "\sconnected" | wc -l`.to_i
  end
  
  resolutions = `DISPLAY=:0 xrandr | grep -E "\sconnected" -A1 --no-group-separator | grep -v -E "\sconnected" | cut -f 4 -d" "`.split("\n")
  $stderr.reopen("/dev/null", "w")
end

(0..Facter.value('screencount').to_i).each do |n|
  Facter.add("screen%d_resolution" % n) do
  confine :operatingsystem => "Fedora"
  
  setcode do
      resolutions[n]
    end
  end
end
