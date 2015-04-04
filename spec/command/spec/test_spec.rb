require File.expand_path('../../../spec_helper', __FILE__)

module Pod
  describe Command::Spec::Test do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ spec test }).should.be.instance_of Command::Spec::Test
      end
    end
  end
end

