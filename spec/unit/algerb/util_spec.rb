require 'algerb/util'

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
end
