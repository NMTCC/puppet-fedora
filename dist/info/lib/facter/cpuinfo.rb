Facter.add('processorflags') do 
  confine :kernel => 'Linux'

  setcode do
    flags = []
    cpuinfo = File.open('/proc/cpuinfo')
    cpuinfo.each_line do |line|
      if line =~ /flags/
        flags = line.split(':')[1].chomp.split.sort
        break
      end
    end
    cpuinfo.close
    result = flags
  end

end
