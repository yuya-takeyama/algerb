require 'spec_helper'

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

  describe '#find_by_path' do
    context 'when no files are matched' do
      subject { root.find_by_path('foo.rb') }
      it { should be_nil }
    end

    context 'when a file is matched in the root' do
      before { root.add(Algerb::File.new('foo.rb')) }
      subject { root.find_by_path('foo.rb') }
      it { should == Algerb::File.new('foo.rb') }
    end

    context 'when a file is matched in a directory' do
      before do
        root.add(Algerb::Files.new('foo',
          'bar.rb' => Algerb::File.new('bar.rb')
        ))
      end
      subject { root.find_by_path('foo/bar.rb') }
      it { should == Algerb::File.new('bar.rb') }
    end

    context 'when a directory is matched in the root' do
      before { root.add(Algerb::Files.new('foo')) }
      subject { root.find_by_path('foo') }
      it { should == Algerb::Files.new('foo') }
    end

    context 'when a directory is matched in a directory' do
      before do
        root.add(Algerb::Files.new('foo',
          'bar' => Algerb::Files.new('bar')
        ))
      end
      subject { root.find_by_path('foo/bar') }
      it { should == Algerb::Files.new('bar') }
    end
  end
end
