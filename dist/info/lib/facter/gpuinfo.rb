Facter.add('gpudrivers') do
  confine :kernel => 'Linux'

  setcode do
    drivers = {}
    uevent = File.open('/sys/class/drm/card0/device/uevent', 'rb')
    lines = uevent.read.chomp.split("\n")
    uevent.close
    lines.sort!
    driver = lines[0].chomp.split('=')[1]
    pciid = lines[3].chomp.split('=')[1]
    drivers[driver] = [pciid]
    result = drivers
  end
  
end
