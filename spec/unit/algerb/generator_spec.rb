require 'spec_helper'

describe Algerb::Generator do
  describe '#generate_autoloader_body' do
    subject { Algerb::Generator.new.generate_autoloader_body(files) }

    context 'with 1 file ("foo.rb")' do
      let(:files) { ["foo.rb"] }

      it { should == "autoload :Foo, 'foo'\n" }
    end

    context 'with 2 files ("foo.rb", "bar.rb")' do
      let(:files) { ["foo.rb", "bar.rb"] }

      it do
        should == "autoload :Bar, 'bar'\n" +
                  "autoload :Foo, 'foo'\n"
      end
    end

    context 'with 2 files ("foo.rb", "foo/bar.rb")' do
      let(:files) { ['foo.rb', 'foo/bar.rb'] }
      it do
        should == "module Foo\n" +
                  "  autoload :Bar, 'foo/bar'\n" +
                  "end\n" +
                  "autoload :Foo, 'foo'\n"
      end
    end

    context 'with 2files ("foo.rb", "foo/bar/baz/foo_bar.rb")' do
      let(:files) { ['foo.rb', 'foo/bar/baz/foo_bar.rb'] }
      it do
        should == "module Foo\n" +
                  "  module Bar\n" +
                  "    module Baz\n" +
                  "      autoload :FooBar, 'foo/bar/baz/foo_bar'\n" +
                  "    end\n" +
                  "  end\n" +
                  "end\n" +
                  "autoload :Foo, 'foo'\n"
      end
    end
  end
end
