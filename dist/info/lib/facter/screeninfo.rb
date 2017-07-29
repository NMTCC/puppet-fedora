Facter.add('resolution') do
  confine :kernel => 'Linux'

  setcode do
    kres = File.open('/sys/class/graphics/fb0/virtual_size', 'rb')
    xy = kres.read.chomp.split(',')
    kres.close
    result = [xy[0].to_i, xy[1].to_i]
  end
  
end
