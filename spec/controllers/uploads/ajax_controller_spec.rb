describe Uploads::AjaxController do
  let(:user) { create(:user) }
  let!(:api_key) { create(:api_key, user: user) }
  let(:params) {
    {
      photo: {
        user_id: user.id,
        token: api_key.token,
        redirect: 'http://localhost/photos/:id',
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', 'image.jpg'))
      }
    }
  }

  context '#create' do
    it 'success' do
      expect {
        post :create, params: params
      }.to change { Photo.count }.by 1
      expect(response).to render_template :create
      expect(assigns(:redirect)).to eq "http://localhost/photos/#{Photo.last.id}"
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