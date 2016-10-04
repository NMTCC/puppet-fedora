Facter.add(:splashscreen) do
  confine :kernel => "Linux"

  setcode do
    splashes = Dir.glob("/usr/share/backgrounds/#{Facter.value(:hostname)}.*")
    if splashes == []
      result = '/usr/share/backgrounds/itcjessie.png'
    else
      result = splashes[0]
    end
  end

end
