Facter.add(:usb) do
  confine :kernel => 'Linux'
  confine :virtual => 'physical'

  setcode do
    mine = { 'keyboard' => [], 'mouse' => [], 'scanner' => [] }
    handlers = { 'keyboard' => 'sysrq', 'mouse' => 'mouse' }
    kinput = File.open('/proc/bus/input/devices', 'rb')
    devs = kinput.read.split("\n\n")
    kinput.close
    devs.each do |dev|
      handlers.each_key do |devtype|
        if dev =~ /#{handlers[devtype]}/
          lines = dev.split("\n")
          name = lines[1].split('=')[1].delete('"').chomp
          vendor = lines[0].split()[2].split('=')[1].chomp
          product = lines[0].split()[3].split('=')[1].chomp
          mine[devtype] << [name, "#{vendor}:#{product}"]
        end
      end
    end
    kusb = File.open('/sys/kernel/debug/usb/devices', 'rb')
    devs = kusb.read.split("\n\n")
    kusb.close
    devs.each do |dev|
      if dev.downcase =~ /scan/
        lines = dev.split("\n")
        name = lines[3].split('=')[1].chomp
        vendor = lines[2].split()[1].split('=')[1].chomp
        product = lines[2].split()[2].split('=')[1].chomp
        mine['scanner'] << [name, "#{vendor}:#{product}"]
      end
    end
    result = mine
  end

end
