Facter.add(:ethernets) do
  confine :kernel => "Linux"

  setcode do
    nics = []
    `lspci -nn | grep Ethernet`.split().each do |nic|
        nics << nic
    end
    result = nics
  end
end
