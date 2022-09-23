RSpec.describe UserRoutes, type: :routes do
  describe 'POST /signup' do
    context 'missing parameters' do
      it 'returns an error' do
        post '/v1/signup', name: 'bob', email: 'bob@example.com', password: '', password_confirmation: ''

        expect(last_response.status).to eq(422)
      end
    end

    context 'invalid parameters' do
      it 'returns an error' do
        post '/v1/signup',name: '', email: 'bob@example.com', password: 'givemeatoken', password_confirmation: 'givemeatoken'

        expect(last_response.status).to eq(422)
        expect(response_body['errors']).to include(
          {
            'detail' => 'Укажите имя',
            'source' => {
              'pointer' => '/data/attributes/name'
            }
          }
        )
      end
    end

    context 'valid parameters' do
      it 'returns created status' do
        post '/v1/signup', name: 'bob', email: 'bob@example.com', password: 'givemeatoken', password_confirmation: 'givemeatoken'

        expect(last_response.status).to eq(201)
      end
    end
  end
end