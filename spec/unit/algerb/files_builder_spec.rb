require 'algerb/files_builder'
require 'algerb/files'

describe Algerb::FilesBuilder do
  let(:builder) { Algerb::FilesBuilder.new }

  describe 'files' do
    subject { builder.files }

    context 'without any files' do
      it { should == Algerb::Files.new }
    end

    context 'when 1 file ("foo.rb") is added' do
      before { builder.add('foo.rb') }
      it { should == Algerb::Files.new.add(Algerb::File.new('foo.rb'))}
    end

    context 'when 1 file ("foo/bar.rb") is added' do
      before { builder.add('foo/bar.rb') }
      it { should == Algerb::Files.new.add(Algerb::Files.new('foo').add(Algerb::File.new('bar.rb')))}
    end
  end
end
