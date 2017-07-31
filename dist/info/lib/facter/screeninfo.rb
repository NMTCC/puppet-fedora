Facter.add('resolution') do
  confine :kernel => 'Linux'

  setcode do
    kres = File.open('/sys/class/graphics/fb0/virtual_size', 'rb')
    xy = kres.read.chomp.split(',')
    kres.close
    result = [xy[0].to_i, xy[1].to_i]
  end
  
end

Facter.add('monitor') do
  confine :kernel => 'Linux'

  setcode do
    monitor = {
      'Manufacturer' => '',
      'Monitor name' => '',
      'Serial number' => ''
    }
    Dir.chdir('/sys/class/drm/card0')
    vidints = Dir.glob('card0-*')
    edid = ''
    vidints.each do |vid|
      edid = `/usr/bin/edid-decode /sys/class/drm/card0/#{vid}/edid`
      if $?.success?
        break
      end
    end
    edid.split("\n").each do |line|
      monitor.each_key do |value|
        if line =~ /#{value}/
          monitor[value] = line.split(': ')[1].chomp
        end
      end
    end
    result = monitor
  end

end
