Facter.add("cdromcount") do
  confine :operatingsystem => "Fedora"

  setcode do
    `lsblk | grep -E "\srom\s" | wc -l`.to_i
  end
end
