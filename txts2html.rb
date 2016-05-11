# encoding: utf-8

=begin
concatenate all text files into a singal html file
first should put file in order like this
-charpter1
  -section1.txt
  -section2.txt
-charpter2
  -section1.txt
  -section2.txt
=end

out_file = File.open("out.html", "w+")

first_floor_of_dir = Dir.open("./")
dir_1_list = []
first_floor_of_dir.each do |name|
  if FileTest.directory?(name)
    if name != "." && name != ".."
      dir_1_list.push(name)
    end
  end
end
first_floor_of_dir.close
p dir_1_list

dir_1_list.each do |dir_1_name|
  out_file.puts("<h1>" + dir_1_name + "</h2>")
  dir = Dir.open(dir_1_name)
  txt_file_list = []
  while name = dir.read
    if name.include?(".txt")
      txt_file_list.push(name)
    end
  end
  dir.close
  p txt_file_list

  txt_file_list.each do |txt_file_name|
    io = File.open(dir_1_name + "/" + txt_file_name)
    file_content = io.readlines()
    first_line = file_content[0]
    out_file.puts("<h2>" + first_line + "</h2>")
    out_file.puts("<p>")
    file_content[1..-1].each { |each_line| out_file.puts(each_line + "</br>") }
    out_file.puts("</p>")
    io.close
  end
end

out_file.close
