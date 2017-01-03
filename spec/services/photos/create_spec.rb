describe Photos::Create do
  let(:user) { create(:user) }
  let!(:photo) { build(:photo, user: user) }

  subject { described_class.new(photo) }

  before(:each) do
    photo.token = nil
  end

  it 'successfully saves the photo' do
    expect(photo).not_to be_persisted
    expect(photo.token).to be_nil

    subject.save

    expect(photo).to be_persisted
    expect(photo.token).not_to be_empty
  end
end