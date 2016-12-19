describe Photos::AjaxController do
  let(:user) { create(:user) }
  let!(:api_key) { create(:api_key, user: user) }

  context '#create' do
    it 'success' do
      params = {
        photo: {
          user_id: user.id,
          token: api_key.token,
          success_redirect_url: 'http://localhost/photos/finish/create/success/:id',
          error_redirect_url: 'http://localhost/photos/finish/create/error',
          image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', 'image.jpg'))
        }
      }

      expect {
        post :create, params: params
      }.to change { Photo.count }.by 1
      expect(response).to render_template :create
      expect(assigns(:redirect)).to eq "http://localhost/photos/finish/create/success/#{Photo.last.id}"
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
      expect(response).to render_template :create
      expect(assigns(:redirect)).to eq 'http://localhost/photos/finish/create/error'
    end
  end
end