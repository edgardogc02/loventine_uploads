describe Photo do
  it 'uses factory' do
    expect(create(:photo)).to be_persisted
  end
end