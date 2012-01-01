require 'spec_helper'

describe Algerb::FilesBuilder do
  let(:builder) { Algerb::FilesBuilder.new }

  describe 'files' do
    subject { builder.files }

    context 'without any files' do
      it { should == Algerb::Files.new }
    end

    context 'when 1 file ("foo.rb") is added' do
      before { builder.add('foo.rb') }
      it {
        should == Algerb::Files.root(
                    'foo.rb' => Algerb::File.new('foo.rb'),
                  )
      }
    end

    context 'when 1 file ("foo/bar.rb") is added' do
      before { builder.add('foo/bar.rb') }
      it {
        should == Algerb::Files.root(
                    'foo' => Algerb::Files.new('foo',
                      'bar.rb' => Algerb::File.new('bar.rb'),
                    )
                  )
      }
    end

    context 'when 2 files ("foo/bar.rb", "foo/baz.rb") are added' do
      before do
        builder.add('foo/bar.rb')
        builder.add('foo/baz.rb')
      end
      it {
        should == Algerb::Files.root(
                    'foo' => Algerb::Files.new('foo',
                      'bar.rb' => Algerb::File.new('bar.rb'),
                      'baz.rb' => Algerb::File.new('baz.rb'),
                    )
                  )
      }
    end

    context 'when a files is added to nested directory' do
      before do
        builder.add('foo/bar/baz.rb')
        builder.add('foo/bar/foo_bar.rb')
      end
      it {
        pending
        should == Algerb::Files.root(
                    'foo' => Algerb::Files.new('foo',
                      'bar' => Algerb::Files.new('bar',
                        'baz.rb' => Algerb::File.new('baz.rb'),
                        'foo_bar.rb' => Algerb::File.new('foo_bar.rb'),
                      )
                    )
                  )
      }
    end
  end

  describe '#mkdir_p' do
    subject { builder.files }
    before { builder.mkdir_p(path) }

    shared_examples_for 'create directory correctly' do
      it { should == expected }
    end

    context 'foo' do
      let(:path) { 'foo' }
      let(:expected) do
        Algerb::Files.root(
          'foo' => Algerb::Files.new('foo')
        )
      end
      it_should_behave_like 'create directory correctly'
    end
  end
end
