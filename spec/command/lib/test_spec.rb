require File.expand_path('../../../spec_helper', __FILE__)

module Pod
  describe Command::Lib::Test do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ lib test }).should.be.instance_of Command::Lib::Test
      end
    end
  end
end

