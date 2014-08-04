require 'fileutils'
module TestFiles
  def temp_file_root
    Pathname.new(File.dirname(__FILE__)).join('..', '..', 'tmp', 'file_tests')
  end

  def create_test_file(name, contents)
    path = temp_file_root.join(name)
    FileUtils.mkdir_p(File.dirname(path))
    File.open(path, 'w') { |f| f.write(contents) }
  end

  def delete_test_files
    FileUtils.rm_rf(temp_file_root.to_s)
  end
end

