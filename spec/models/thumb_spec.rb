describe Thumb do
  it 'contains only given sizes' do
    expect(described_class.underscored_names.map(&:to_sym)).to match_array [:mini, :small, :medium, :big]

    expect(described_class[:mini].height).to eq 50
    expect(described_class[:mini].width).to eq 50

    expect(described_class[:small].height).to eq 100
    expect(described_class[:small].width).to eq 100

    expect(described_class[:medium].height).to eq 150
    expect(described_class[:medium].width).to eq 150

    expect(described_class[:big].height).to eq 200
    expect(described_class[:big].width).to eq 200
  end
end