Facter.add(:apt_hold) do
  confine :kernel => "Linux"

  setcode do
    held = `apt-mark showhold`
    result = held.split()
  end

end
