Facter.add(:activetorrents) do
  confine :kernel => "Linux"

  setcode do
    torrents = `transmission-remote -t all -i | awk '/Hash/ { print $2 }'`
    result = torrents.split()
  end

end
