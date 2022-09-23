RSpec.describe Users::CreateService do
  subject { described_class }

  context 'valid parameters' do
    let(:user_params) do
      {
        name: 'Doe John',
        email: 'john@doe.com',
        password: '123456',
        password_confirmation: '123456'
      }
    end

    it 'creates a new user' do
      expect { subject.call(user_params) }
        .to change { User.count }.from(0).to(1)
    end

    it 'assigns user' do
      result = subject.call(user_params)

      expect(result.user).to be_kind_of(User)
    end
  end

  context 'invalid parameters' do
    let(:user_params) do
      {
        name: 'Doe John',
        email: 'john@doe.com',
        password: '',
        password_confirmation: ''
      }
    end

    it 'does not create user' do
      expect { subject.call(user_params) }
        .not_to change { User.count }
    end

    it 'assigns user' do
      result = subject.call(user_params)

      expect(result.user).to be_kind_of(User)
    end
  end
end