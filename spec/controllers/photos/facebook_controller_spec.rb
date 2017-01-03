describe Photos::FacebookController do
  let(:user) { create(:user) }
  let!(:api_key) { create(:api_key, user: user) }

  context '#create' do
    it 'success' do
      params = {
        photo: {
          user_id: user.id,
          token: api_key.token,
          success_redirect_url: 'http://localhost/photos/finish/create/success/:id',
          remote_image_url: 'https://www.blog.loventine.com/wp-content/uploads/2015/02/logo.png'
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
          remote_image_url: nil
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