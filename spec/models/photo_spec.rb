describe ApiKey do
  it 'uses factory' do
    expect(create(:api_key)).to be_persisted
  end
end