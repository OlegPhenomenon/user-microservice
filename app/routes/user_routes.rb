class UserRoutes < Application
  namespace '/v1' do
    post '/signup' do
      user_params = validate_with(UserParamsContract)

      result = Users::CreateService.call(
        email: user_params[:email],
        name: user_params[:name],
        password: user_params[:password],
        password_confirmation: user_params[:password_confirmation]
      )

      return status 201 if result.success?
       
      status 422
      error_response result.user
    end
  end
end