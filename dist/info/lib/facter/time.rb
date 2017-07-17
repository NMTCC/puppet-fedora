Facter.add(:nodehour) do
  confine :kernel => "Linux"

  setcode do
    result = `date +%H`
  end

end

Facter.add(:nodemin) do
  confine :kernel => "Linux"

  setcode do
    result = `date +%M`
  end
end
