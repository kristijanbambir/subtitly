# subtitly, fix unsynchronized SRT subtitles
# version 1.0
# (c) 2012 Kristijan Bambir [www.kristijanbambir.from.hr]
# released under the MIT license

# quit unless our script gets two command line arguments
unless ARGV.length == 2
  puts "Invalid number of arguments.\n"
  puts "Usage: ruby SubtitleFix.rb SUBTITLE_FILE OFFSET\n"
  puts "OFFSET must be in seconds."
  exit
end

# subtitle file
subtitle_file = ARGV[0]

# offset in seconds
offset = ARGV[1]

lines = File.open(subtitle_file).readlines

def add_seconds(time, offset)
  # 01:18:51,340
  hours   = time.split(/:/)[0]
  minutes = time.split(/:/)[1]
  seconds = time.split(/:/)[2]
  
  decimal_comma = false
  
  if seconds =~ /,/ then
    seconds = seconds.sub(/,/, ".")
    decimal_comma = true
  end
  
  offset  = offset.sub(/,/, ".")
  
  seconds_sum = hours.to_f * 3600 + minutes.to_f * 60 + seconds.to_f + offset.to_f
  
  hours   = "%02d"   % (seconds_sum / 3600 % 60)
  minutes = "%02d"   % (seconds_sum / 60 % 60)
  seconds = "%06.3f" % (seconds_sum % 60)
  
  if decimal_comma == true then
    seconds = seconds.sub(/\./, ",")
  end
  
  return hours + ":" + minutes + ":" + seconds
end

lines.each do |line|
  if line =~ /\d\d:\d\d:\d\d,\d\d\d\s-->\s\d\d:\d\d:\d\d,\d\d\d/ then
    times = line.split(/ --> /)
    from = add_seconds(times[0], offset)
    to   = add_seconds(times[1], offset)
    line.replace(from + " --> " + to)
  end
end

File.open(subtitle_file, 'w') do |f|
  f.puts(lines)
  puts "Subtitles fixed!"
end
