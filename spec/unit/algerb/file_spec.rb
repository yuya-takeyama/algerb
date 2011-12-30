require 'algerb/file'

describe Algerb::File do
  subject { Algerb::File.new(path) }

  context 'without dir ("foo")' do
    let(:path) { 'foo' }

    its(:path) { should == 'foo' }
    its(:file) { should == 'foo' }
  end

  context 'with 1 nested dir ("foo/bar")' do
    let(:path) { 'foo/bar' }

    its(:path) { should == 'foo/bar' }
    its(:file) { should == 'bar' }
  end

  context 'with 2 nested dir ("foo/bar/baz")' do
    let(:path) { 'foo/bar/baz' }

    its(:path) { should == 'foo/bar/baz' }
    its(:file) { should == 'baz' }
  end

  describe '#==' do
    subject { a == b }

    context 'when both has same path ("foo")' do
      let(:a) { Algerb::File.new('foo') }
      let(:b) { Algerb::File.new('foo') }

      it { should be_true }
    end

    context 'when both has same path ("foo/bar")' do
      let(:a) { Algerb::File.new('foo/bar') }
      let(:b) { Algerb::File.new('foo/bar') }

      it { should be_true }
    end

    context 'when path has different' do
      let(:a) { Algerb::File.new('foo/bar') }
      let(:b) { Algerb::File.new('foo/bar/bar') }

      it { should be_false }
    end
  end
end
