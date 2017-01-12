Facter.add(:stringify) do
  confine :kernel => "Linux"

  setcode do
    if system('grep stringify /etc/puppet/puppet.conf > /dev/null')
        result = true
    end
  end
end
