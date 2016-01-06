get 'login' do
  erb :'/login'
end

get 'login/new' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.user_id
    redirect :'/users/#{@user.id}'
  else
    redirect :'/login'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
