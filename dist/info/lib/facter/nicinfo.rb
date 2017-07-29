Facter.add("netdrivers") do
  confine :kernel => 'Linux'

  setcode do
    drivers = {}
    Dir.chdir('/sys/class/net/')
    nics = Dir.glob('*')
    nics.delete('lo')
    nics.each do |nic|
      uevent = File.open("/sys/class/net/#{nic}/device/uevent", 'rb')
      lines = uevent.read.chomp.split("\n")
      uevent.close
      lines.sort!
      driver = lines[0].chomp.split('=')[1]
      pciid = lines[3].chomp.split('=')[1]
      if drivers.has_key?(driver)
        drivers[driver] << pciid
      else
        drivers[driver] = [pciid]
      end
    end
    drivers.each_key do |driver|
      drivers[driver] = drivers[driver].sort.uniq
    end
    result = drivers
  end

end
