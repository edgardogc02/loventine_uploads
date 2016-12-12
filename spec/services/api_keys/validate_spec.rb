describe ApiKeys::Validate do
  let(:token) { 'MY_SECRET_TOKEN' }
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let!(:api_key) { create(:api_key, token: token, user: user) }
  let!(:another_api_key) { create(:api_key, token: 'TOKEN', user: another_user) }

  context '#call' do
    it 'finds record and returns true' do
      expect(described_class.call(user.id, token)).to eq true
    end

    it 'does not find record and return false' do
      expect(described_class.call(another_user.id, token)).to eq false

      expect(described_class.call(user.id, 'TOKEN')).to eq false
      expect(described_class.call(another_user.id, 'SOME TOKEN')).to eq false
    end
  end
end