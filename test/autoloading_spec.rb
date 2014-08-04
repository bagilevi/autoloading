require 'pathname'
$: << Pathname.new(File.dirname(__FILE__)).join('..', 'lib')
require 'minitest/autorun'
require 'autoloading'
require_relative 'support/test_files'


describe Autoloading do
  include TestFiles

  after do
    delete_test_files
  end

  it "works" do
    create_test_file "hello.rb", <<-FILE
      module Hello
        extend Autoloading
      end
    FILE

    create_test_file "hello/kitty.rb", <<-FILE
      module Hello::Kitty
      end
    FILE

    $: << temp_file_root.to_s
    require 'hello'
    Hello::Kitty
  end
end

