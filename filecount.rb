require 'rbconfig'

# Detects the operating system that the script is being run on
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

# Initializes the array
directories = Array.new

# If the operating system is a Unix, Linux, OS X, or other BSD system
if os == :nix 
# Put the header row
  puts "*nix directory|count"
# Glob the directory
  directories = Dir.glob('/'"**/")
# Sort the list of directories
  directories.sort!
# Count the number of files, per directory
  directories.each do |countycount|
    filecount = Dir.glob(File.join(countycount, '**', '*')).select { |file| File.file?(file) }.count
# Print the directory and count of files in '|' delimited format
    puts "#{countycount}|#{filecount}"
  end
# If the operating system is a Windows system
else
# Header row
  puts "Windows directory|count"
# Glob the directory
  directories = Dir.glob("/**/")   
# Sort the list of directories
  directories.sort!
# Count the number of files, per directory
  directories.each do |countycount|
    filecount = Dir.glob(File.join(countycount, '**', '*')).select { |file| File.file?(file) }.count
# Print the directory and count of files in '|' delimited format
  puts "#{countycount}|#{filecount}"
  end
end
