describe ThumbsController do

  context '#show' do
    let(:photo) { create(:photo) }
    let(:options) {
      {
        type: 'image/jpeg',
        disposition: 'inline'
      }
    }

    before(:each) do
      expect(controller).to receive(:send_file).with(photo.image.send(:mini).path, options) do
        controller.render nothing: true
      end
    end

    it 'returns existing thumb file' do
      get :show, params: { token: photo.token, version: 'mini' }
      expect(File.exist?(photo.image.send(:mini).path)).to eq true
    end

    it 'creates new thumb file and returns it' do
      FileUtils.rm(photo.image.send(:mini).path)
      expect(File.exist?(photo.image.send(:mini).path)).not_to eq true

      get :show, params: { token: photo.token, version: 'mini' }

      expect(File.exist?(photo.image.send(:mini).path)).to eq true
    end
  end
end