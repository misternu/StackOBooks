 get '/users' do
  @user = User.all
  erb :'login'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect :"/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  if session[:user_id] == @user.id
    erb :'/users/show'
  else
    redirect :'/login'
  end
end

get '/users/:user_id/posts/:post_id' do
  @user = User.find(params[:user_id])
  @post = Post.find(params[:post_id])
  erb :'/posts/show'
end
