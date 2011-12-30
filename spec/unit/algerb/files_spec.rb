require 'algerb/files'

describe Algerb::Files do
  let(:files) { Algerb::Files.new }

  describe '#files' do
    subject { files.files }

    context 'if empty' do
      it { should eq  [] }
    end

    context 'without sub directory' do
      context 'with 1 file' do
        before { files.push('foo') }

        it { should == [Algerb::File.new('foo')] }
      end

      context 'with 2 files' do
        before do
          files.push('foo')
          files.push('bar')
        end

        it { should == [Algerb::File.new('bar'), Algerb::File.new('foo')] }
      end
    end
  end
end
