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
end
