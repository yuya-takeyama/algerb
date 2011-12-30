require 'algerb/files'

describe Algerb::Files do
  let(:root) { Algerb::Files.new }

  describe '#files' do
    subject { root.files }

    context 'when no files are added' do
      it { should == {} }
    end

    context 'when 1 file ("foo.rb") is added' do
      before { root.add(file) }
      let(:file) { Algerb::File.new('foo.rb') }

      it { should == {'foo.rb' => file} }
    end

    context 'when 2 files ("foo.rb", "bar.rb") are added' do
      before do
        root.add(file1)
        root.add(file2)
      end

      let(:file1) { Algerb::File.new('foo.rb') }
      let(:file2) { Algerb::File.new('bar.rb') }

      it { should == {'foo.rb' => file1, 'bar.rb' => file2} }
    end

    context 'when 1 dir ("foo") is added' do
      before { root.add(dir) }
      let(:dir) { Algerb::Files.new('foo') }

      it { should == {'foo' => dir} }
    end

    context 'when 2 dirs ("foo", "bar") are added' do
      before do
        root.add(dir1)
        root.add(dir2)
      end

      let(:dir1) { Algerb::Files.new('foo') }
      let(:dir2) { Algerb::Files.new('bar') }

      it { should == {'foo' => dir1, 'bar' => dir2} }
    end
  end
end
