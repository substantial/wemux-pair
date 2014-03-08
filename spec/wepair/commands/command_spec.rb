require 'spec_helper'

require 'wepair/commands/command'

describe WePair::Commands::Command do
  it "should assigns key/values passed in as attributes" do
    base = WePair::Commands::Command.new(foo: 'bar', baz: 'qux')
    base.foo.should eq 'bar'
    base.baz.should eq 'qux'
  end

  describe '#execute' do
    subject { WePair::Commands::Command.new }
    it 'should throws NotImplementedError' do
      expect{ subject.execute }.to raise_error(NotImplementedError)
    end
  end

  describe '#run' do
    subject { WePair::Commands::Command.run(foo: 'bar')}

    it 'should assign attributes and call execute' do
      base =  double :base_command
      WePair::Commands::Command.stub(:new).and_return(base)

      WePair::Commands::Command.should_receive(:new).with(foo: 'bar')
      base.should_receive(:execute)

      subject
    end
  end
end
