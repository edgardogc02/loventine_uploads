describe Photos::Backup do
  let(:user) { create(:user) }
  let!(:photo) { create(:photo, user: user) }

  subject { described_class.call(photo) }

  it 'successfully saves the photo' do
    expect(photo.image_bck.url).to eq nil
    described_class.call(photo)
    photo.reload
    expect(photo.image_bck.url).not_to eq nil
  end
end