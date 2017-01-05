describe Photos::BackupJob do
  it 'perform' do
    photo = create(:photo)
    expect(photo.image_bck.url).to eq nil
    described_class.new.perform(photo.id)
    photo.reload
    expect(photo.image_bck.url).not_to eq nil
  end
end