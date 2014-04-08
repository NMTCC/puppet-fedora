Facter.add("niccount") do
  confine :operatingsystem => "Fedora"

  setcode do
    `lspci -m | grep -i ethernet | wc -l`.to_i
  end
  
  nics = `lspci -m | grep -i ethernet | cut -f 4-6 -d'"' | tr -d '"'`.split("\n")
end

(0..Facter.value('niccount').to_i).each do |n|
  Facter.add("nic%d" % n) do
  confine :operatingsystem => "Fedora"

  setcode do
      nics[n]
    end
  end
end
