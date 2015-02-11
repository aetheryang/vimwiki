class String
  def convert_german!
  # Change the german world like '\a' into 'ä'.
  gsub!("\\a", "ä")
  gsub!("\\A", "Ä")
  gsub!("\\o", "ö")
  gsub!("\\O", "Ö")
  gsub!("\\u", "ü")
  gsub!("\\U", "Ü")
  gsub!("\\s", "ß")
  # Change the *.* in to the tail mode
  gsub!("*e*", '<tail>e</tail>')
  gsub!("*en*", '<tail>en</tail>')
  gsub!("*er*", '<tail>er</tail>')
  gsub!("*em*", '<tail>em</tail>')
  return self
  end
end

Dir["./*.wiki"].each do |filename|
  if File.exist?(filename)
    newfile = []
    File.open(filename) do |file|
      file.each_line { |line| newfile << line.replace(line.convert_german!) }
    end
    File.open(filename, "wt+") { |file| file.puts newfile }
  else
    p 'wrong'
  end
end
