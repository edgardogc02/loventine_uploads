describe PhotosController do
  let(:user) { create(:user) }
  let!(:api_key) { create(:api_key, user: user) }
  let!(:photo) { create(:photo, user: user) }

  context '#validate_token' do
    it 'fails' do
      patch :update, params: { id: photo.id, photo: { user_id: user.id, token: 'INVALID TOKEN' } }
      expect(response.body).to be_blank
      expect(response.status).to eq 401
    end
  end

  context '#validate_user_and_photo' do
    let!(:photo) { create(:photo) }

    it 'fails' do
      patch :update, params: { id: photo.id, format: :json, photo: { user_id: user.id, token: api_key.token } }
      expect(response.body).to be_blank
      expect(response.status).to eq 401
    end
  end

  context '#update' do
    it 'success' do
      expect {
        patch :update, params: { id: photo.id, format: :json, photo: { user_id: user.id, token: api_key.token } }
      }.not_to change { Photo.count }
      expect(response.body).to be_blank
      expect(response).to be_success
    end
  end

  context '#show' do
    let(:options) {
      {
        type: 'image/jpeg',
        disposition: 'inline'
      }
    }

    before(:each) do
      expect(controller).to receive(:send_file).with(photo.image.path, options) do
        controller.render nothing: true
      end
    end

    it 'returns image filename' do
      get :show, params: { token: photo.token, hash: 'some strange hash', version: 'mini' }
      expect(response).to be_success
    end
  end

end