Facter.add(:template) do
  confine :kernel => "Linux"

  setcode do
    bootpart = `df --output=source /boot | tail -1`
    case bootpart
    when '/dev/sda1'
      result = 'linux-only'
    when '/dev/sda3'
      result = 'dual-boot'
    else
      result = 'unknown'
    end
  end

end
