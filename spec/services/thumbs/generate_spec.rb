describe Thumbs::Generate do
  let(:user) { create(:user) }
  let(:photo) { create(:photo, user: user) }

  subject { described_class.new(photo) }

  context '#call' do
    Thumb.underscored_names.map(&:to_sym).each do |version|
      it "creates #{version} version of file and returns it" do
        filename = Rails.root.join('public', 'uploads', 'photos', photo.token, "#{version}_image.jpg").to_s
        expect(subject.call(version)).to eq filename
      end
    end
  end
end