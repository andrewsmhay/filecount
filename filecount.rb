require 'rbconfig'

def os 
    @os ||= (
      host_os = RbConfig::CONFIG['host_os']
      case host_os
      when /mswin|msys|mingw|bccwin|wince/
        :windows
      when /darwin|mac os|linux|solaris|bsd/
        :nix
      else
        raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
     end
)
end

directories = Array.new

if os == :nix 
  puts "*nix directory|count"
  directories = Dir.glob('/'"**/")
  directories.sort!
  directories.each do |countycount|
    filecount = Dir.glob(File.join(countycount, '**', '*')).select { |file| File.file?(file) }.count
    puts "#{countycount}|#{filecount}"
  end
else
  puts "Windows directory|count"
  directories = Dir.glob("/**/")   
  directories.sort!
  directories.each do |countycount|
    filecount = Dir.glob(File.join(countycount, '**', '*')).select { |file| File.file?(file) }.count
    puts "#{countycount}|#{filecount}"
  end
end
