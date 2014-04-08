Facter.add("gpucount") do
  confine :operatingsystem => "Fedora"

  setcode do
    `lspci -m | grep -i vga | wc -l`.to_i
  end
  
  gpus = `lspci -m | grep -i vga | cut -f 4-6 -d'"' | tr -d '"'`.split("\n")
end

(0..Facter.value('gpucount').to_i).each do |n|
  Facter.add("gpu%d" % n) do
  confine :operatingsystem => "Fedora"

  setcode do
      gpus[n]
    end
  end
end
