Facter.add("cpu_flags") do 
  confine :operatingsystem => "Fedora"

  setcode do
    Facter::Util::Resolution.exec("cat /proc/cpuinfo | grep 'flags' | uniq").gsub(/\s*?flags\s*?:\s*?/,'')
  end
end
