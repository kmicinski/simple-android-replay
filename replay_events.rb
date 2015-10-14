lines = IO.readlines(ARGV[0])

# Cut out the lines before "ould not get driver version for..." line
i = 0
lines.each do |line|
  if (line =~ /\/dev\/input\/mice/) then break end
  i = i+1
end
lines = lines[i+1..-1]

puts "replaying..."

# Replay the log
last_time = nil

lines.each do |line|
  c = line.split
  time = Float(c[0])
  device = c[1].chomp(':')
  type = Integer('0x'.concat(c[2]))
  code = Integer('0x'.concat(c[3]))
  value = Integer('0x'.concat(c[4]))

  # First: sleep for the appropriate amount of time
  if (last_time != nil) then
    wait = time - last_time
    sleep(wait)
    last_time = time
  else 
    last_time = time
  end
  
  # Next: send event to app
  cmd = "sendevent #{device} #{type} #{code} #{value}"
  puts cmd
  `adb shell #{cmd}`
end
