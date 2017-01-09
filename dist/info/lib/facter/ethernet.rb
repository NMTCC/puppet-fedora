Facter.add(:ethernets) do
  confine :kernel => "Linux"

  setcode do
    nics = []
    `lspci -nn | grep Ethernet`.each_line do |nic|
        nics << nic.chomp
    end
    result = nics
  end
end
