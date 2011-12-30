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
  end
end
