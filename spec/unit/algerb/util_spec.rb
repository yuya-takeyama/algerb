require 'spec_helper'

describe Algerb::Util do
  include Algerb::Util

  describe '#file_to_class' do
    subject { file_to_class(file) }
    
    context 'with file name only alpabets' do
      let(:file) { 'foo' }
      it 'should be capitalized' do
        subject.should == 'Foo'
      end
    end

    context 'with file name with alphabets and underscore' do
      let(:file) { 'foo_bar' }

      it 'should be CamelCase' do
        subject.should == 'FooBar'
      end
    end
  end

  describe '#indentation' do
    subject { indentation(code, 2) }

    context 'with single line' do
      let(:code) { "foo\n" }

      it { should == "  foo\n" }
    end

    context 'with multiple lines' do
      let(:code) { "foo\nbar" }

      it { should == "  foo\n  bar\n" }
    end
  end

  describe '#remove_dir' do
    subject { remove_dir(path) }

    context 'without dir ("foo")' do
      let(:path) { 'foo' }

      it { should == 'foo' }
    end

    context 'with 1 nested dir ("foo/bar")' do
      let(:path) { 'foo/bar' }

      it { should == 'bar' }
    end

    context 'with 2 nested dir ("foo/bar/baz")' do
      let(:path) { 'foo/bar/baz' }

      it { should == 'baz' }
    end
  end

  describe '#remove_ext' do
    subject { remove_ext(path) }

    context 'without directory ("foo.rb")' do
      let(:path) { 'foo.rb' }

      it { should == 'foo' }
    end

    context 'with directory ("foo/bar.rb")' do
      let(:path) { 'foo/bar.rb' }

      it { should == 'foo/bar' }
    end
  end

  describe '#split_dir_and_file' do
    subject { split_dir_and_file(path) }

    context 'foo.rb' do
      let(:path) { 'foo.rb' }
      it { should == [nil, 'foo.rb'] }
    end

    context 'foo/bar.rb' do
      let(:path) { 'foo/bar.rb' }
      it { should == ['foo', 'bar.rb'] }
    end

    context 'foo/bar/baz.rb' do
      let(:path) { 'foo/bar/baz.rb' }
      it { should == ['foo/bar', 'baz.rb'] }
    end
  end

  describe '#split_path_as_head_and_tail' do
    subject { split_path_as_head_and_tail(path) }

    shared_examples_for 'head and tail are correct' do
      it { should == [head, tail] }
    end

    context 'foo.rb' do
      let(:path) { 'foo.rb' }
      it { should == ['foo.rb'] }
    end

    context 'foo/bar.rb' do
      let(:path) { 'foo/bar.rb' }
      let(:head) { 'foo' }
      let(:tail) { 'bar.rb' }
      it_should_behave_like 'head and tail are correct'
    end

    context 'foo/bar/baz.rb' do
      let(:path) { 'foo/bar/baz.rb' }
      let(:head) { 'foo' }
      let(:tail) { 'bar/baz.rb' }
      it_should_behave_like 'head and tail are correct'
    end
  end
end
