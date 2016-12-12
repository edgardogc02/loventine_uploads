describe Photos::FormCreate, type: :form  do
  let!(:user) { create(:user) }
  let!(:photo) { Photo.new }

  context '#save' do
    let(:params) {
      {
        is_avatar: true,
        user_id: user.id,
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', 'image.jpg'))
      }
    }
    subject { described_class.new(photo) }

    it 'success' do
      expect(subject.save(params)).to eq true
      expect(photo).to be_persisted

      # state will always be set to pending
      expect(photo.state.to_sym).to eq :pending
    end

    it 'dont let user upload multiple avatars' do
      create(:photo, :avatar, user: user)

      expect(subject.save(params)).to eq true
      expect(photo).to be_persisted

      expect(photo.is_avatar).not_to eq true
    end
  end

  context 'when validations' do
    subject { described_class.new(Photo.new) }

    [:image, :state, :user_id].each do |attr|
      it "should validate presence of #{attr}" do
        is_expected.to validate_presence_of(attr)
      end
    end

    it 'validate_inclusion_of is_avatar in [true, false]' do
      is_expected.to allow_value(true).for(:is_avatar)
      is_expected.to allow_value(false).for(:is_avatar)
    end
  end
end