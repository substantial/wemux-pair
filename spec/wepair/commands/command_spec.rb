require 'spec_helper'

require 'wemux/pair/commands/command'

describe Wemux::Pair::Commands::Command do
  it "should assigns key/values passed in as attributes" do
    base = Wemux::Pair::Commands::Command.new(foo: 'bar', baz: 'qux')
    base.foo.should eq 'bar'
    base.baz.should eq 'qux'
  end

  describe '#execute' do
    subject { Wemux::Pair::Commands::Command.new }
    it 'should throws NotImplementedError' do
      expect{ subject.execute }.to raise_error(NotImplementedError)
    end
  end

  describe '#run' do
    subject { Wemux::Pair::Commands::Command.run(foo: 'bar')}

    it 'should assign attributes and call execute' do
      base =  double :base_command
      Wemux::Pair::Commands::Command.stub(:new).and_return(base)

      Wemux::Pair::Commands::Command.should_receive(:new).with(foo: 'bar')
      base.should_receive(:execute)

      subject
    end
  end
end
