describe Uploads::ClassicController do
  let(:user) { create(:user) }
  let!(:api_key) { create(:api_key, user: user) }
  let(:image) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', 'image.jpg')) }

  it '#allow_iframe' do
    post :create, params: { photo: { user_id: user.id, token: api_key.token, redirect: '', image: image } }
    expect(response.headers).not_to include 'X-Frame-Options'
  end

  context '#validate_token' do
    it 'fails' do
      redirect = 'http://localhost/photos/:id'
      post :create, params: { photo: { user_id: user.id, token: 'INVALID TOKEN', redirect: redirect, image: image } }
      expect(response).to render_template 'uploads/ajax/create'
      expect(response.status).to eq 401
    end
  end

  context '#create' do
    it 'success' do
      redirect = 'http://localhost/photos/:id'
      expect {
        post :create, params: { photo: { user_id: user.id, token: api_key.token, redirect: redirect, image: image } }
      }.to change { Photo.count }.by 1
      expect(response.headers['Location']).to eq "http://localhost/photos/#{Photo.last.id}"
      expect(response.status).to eq 303 # status is 'see other'
    end

    it 'fails' do
      pending
      expect {
        post :create, params: { photo: { user_id: user.id, token: api_key.token, redirect: '', image: nil } }
      }.not_to change { Photo.count }
      expect(response).to render_template :new
    end
  end
end