describe Photos::ClassicController do
  let(:user) { create(:user) }
  let!(:api_key) { create(:api_key, user: user) }
  let(:image) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', 'image.jpg')) }

  it '#allow_iframe' do
    params = {
      photo: {
        user_id: user.id,
        token: api_key.token,
        success_redirect_url: 'http://localhost/photos/finish/create/success/:id',
        image: image
      }
    }

    post :create, params: params
    expect(response.headers).not_to include 'X-Frame-Options'
  end

  context '#validate_token' do
    it 'fails' do
      params = {
        photo: {
          user_id: user.id,
          token: 'INVALID TOKEN',
          success_redirect_url: 'http://localhost/photos/finish/create/success/:id',
          image: image
        }
      }
      post :create, params: params
      expect(response).to render_template 'photos/ajax/create'
      expect(response.status).to eq 401
    end
  end

  context '#create' do
    it 'success' do
      params = {
        photo: {
          user_id: user.id,
          token: api_key.token,
          success_redirect_url: 'http://localhost/photos/finish/create/success/:id',
          image: image
        }
      }

      expect {
        post :create, params: params
      }.to change { Photo.count }.by 1
      expect(response.headers['Location']).to eq "http://localhost/photos/finish/create/success/#{Photo.last.id}"
      expect(response.status).to eq 303 # status is 'see other'
    end

    it 'fails' do
      params = {
        photo: {
          user_id: user.id,
          token: api_key.token,
          success_redirect_url: 'http://localhost/photos/finish/create/success/:id',
          error_redirect_url: 'http://localhost/photos/finish/create/error',
          image: nil
        }
      }

      expect {
        post :create, params: params
      }.not_to change { Photo.count }
      expect(response.headers['Location']).to eq 'http://localhost/photos/finish/create/error'
      expect(response.status).to eq 303 # status is 'see other'
    end
  end
end