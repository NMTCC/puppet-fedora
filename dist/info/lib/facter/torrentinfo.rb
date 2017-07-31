Facter.add(:torrentsactive) do
  confine :kernel => "Linux"

  setcode do
    torrents = `pgrep transmission > /dev/null && transmission-remote -t all -i | awk '/Hash/ { print $2 }'`
    result = torrents.split()
  end

end

Facter.add(:torrentscomplete) do
  confine :kernel => "Linux"

  setcode do
    torrents = []
    Dir.chdir('/var/lib/transmission-daemon/downloads') do
      torrents = Dir.glob('*')
    end
    torrents.delete('incomplete')
    result = torrents
  end
end
