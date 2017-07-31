Facter.add(:nodehour) do
  confine :kernel => "Linux"

  setcode do
    result = `date +%H`.to_i
  end

end

Facter.add(:nodemin) do
  confine :kernel => "Linux"

  setcode do
    result = `date +%M`.to_i
  end
end
