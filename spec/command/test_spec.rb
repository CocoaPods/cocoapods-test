require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Test do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ test }).should.be.instance_of Command::Test
      end
    end
  end
end

