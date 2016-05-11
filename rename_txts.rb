# encoding: utf-8
# Purpose: modify the name of the file under the subdirectory to the first line in the file.

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
    first_line = io.readlines()[0]
    new_name = first_line.sub(/\n/, '') + ".txt"
    io.close # Before renaming a file, io must be closed, otherwise permission denied.
    File.rename(dir_1_name + "/" + txt_file_name, dir_1_name + "/" + new_name)
  end
end