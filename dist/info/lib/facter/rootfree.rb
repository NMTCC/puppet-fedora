Facter.add(:rootfree) do
  confine :kernel => "Linux"

  setcode do
    `df --output=avail / | tail -1`.to_i
  end

end
