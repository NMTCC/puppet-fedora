Facter.add(:splashscreen) do
  confine :kernel => "Linux"

  setcode do
    splashes = Dir.glob("/usr/share/backgrounds/nmt/#{Facter.value(:hostname)}.*")
    if splashes == []
      result = '/usr/share/backgrounds/nmtstretch.png'
    else
      result = splashes[0]
    end
  end

end
