require 'algerb/generator'

describe Algerb::Generator do
  describe '#generate_autoloader_body' do
    subject { Algerb::Generator.new.generate_autoloader_body(files) }

    context 'with single file' do
      let(:files) { ["foo"] }

      it { should == "autoload :Foo, 'foo'\n" }
    end

    context 'with 2 files' do
      let(:files) { ["foo", "bar"] }

      it do
        should == "autoload :Foo, 'foo'\n" +
                  "autoload :Bar, 'bar'\n"
      end
    end
  end
end
