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
end
