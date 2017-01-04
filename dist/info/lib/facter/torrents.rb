Facter.add(:torrentsactive) do
  confine :kernel => "Linux"

  setcode do
    torrents = `transmission-remote -t all -i | awk '/Hash/ { print $2 }'`
    result = torrents.split()
  end

end

Facter.add(:torrentscomplete) do
  confine :kernel => "Linux"

  setcode do
    torrents = Dir.glob('/var/lib/transmission-daemon/downloads')
    torrents.delete('incomplete')
    result = torrents
  end
end
