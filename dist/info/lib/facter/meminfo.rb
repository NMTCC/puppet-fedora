Facter.add("memorymodulecount") do
  confine :operatingsystem => "Fedora"

  setcode do
    `dmidecode -t 16 | grep -i 'number' | sed -r 's/^.+?: //g'`.to_i
  end
  
  memspeeds = []
  memsizes = []
  `dmidecode -t 17 | grep -i speed`.split("\n").each {|i| memspeeds.push(i.gsub(/\s*?[Ss]peed:\s*/,''))}
  `dmidecode -t 17 | grep -i size`.split("\n").each {|i| memsizes.push(i.gsub(/\s*?[Ss]ize:\s*/,''))}
end

(0...Facter.value('memorymodulecount').to_i).each do |n|
  Facter.add("memory%d_speed" % n) do
  confine :operatingsystem => "Fedora"

  setcode do
      memspeeds[n]
    end
  end
end

(0...Facter.value('memorymodulecount').to_i).each do |n|
  Facter.add("memory%d_size" % n) do
  confine :operatingsystem => "Fedora"

  setcode do
      memsizes[n]
    end
  end
end
