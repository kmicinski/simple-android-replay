# Captures an event log from an Android device

require 'pty'

PTY.getpty("adb shell getevent") do |r,w,pid|
  while true do 
    line = r.gets 
    puts "#{Time.now.to_f} #{line}"
  end
end
