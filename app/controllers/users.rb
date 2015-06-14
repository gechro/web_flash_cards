get '/users/:id' do
  @user = User.find(session[:user_id])
  erb :'users/profile'
end

