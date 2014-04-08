Facter.add("scannercount") do
  confine :operatingsystem => "Fedora"

  setcode do
    `scanimage --list-devices | grep -E "^device" | wc -l`.to_i
  end
  
  scanners = `scanimage --list-devices | cut -f 5- -d" "`.split("\n")
end

(0..Facter.value('scannercount').to_i).each do |n|
  Facter.add("scanner%d" % n) do
  confine :operatingsystem => "Fedora"

  setcode do
      scanners[n]
    end
  end
end
