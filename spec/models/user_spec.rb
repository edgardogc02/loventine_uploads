describe User do
  it 'uses factory' do
    expect(create(:user)).to be_persisted
  end
end