Facter.add(:usb) do
  confine :kernel => 'Linux'
  confine :virtual => 'physical'

  setcode do
    mine = { 'keyboard' => [], 'mouse' => [], 'scan' => [] }
    kusb = File.open('/sys/kernel/debug/usb/devices', 'rb')
    devs = kusb.read.split("\n\n")
    kusb.close
    devs.each do |dev|
      mine.each_key do |devtype|
        if dev.downcase =~ /#{devtype}/
          lines = dev.split("\n")
          brand = lines[3].split('=')[1].chomp
          vendor = lines[2].split('=')[1].split()[0].chomp
          id = lines[2].split('=')[2].split()[0].chomp
          mine[devtype] << [brand, "#{vendor}:#{id}"]
        end
      end
    end
    result = mine
  end

end
