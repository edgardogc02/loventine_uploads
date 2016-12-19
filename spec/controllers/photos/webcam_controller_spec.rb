describe Photos::WebcamController do
  let(:user) { create(:user) }
  let!(:api_key) { create(:api_key, user: user) }
  let(:params) {
    {
      photo: {
        user_id: user.id,
        token: api_key.token,
        redirect: 'http://localhost/photos/:id',
        image: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUAAAADwCAYAAABxLb1rAAAgAElEQVR4X'
      }
    }
  }

  context '#create' do
    it 'success' do
      expect {
        post :create, params: params
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