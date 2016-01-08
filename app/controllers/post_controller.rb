get '/posts' do
  @posts = Post.all
  erb :"posts/index"
end

# form to create new post
get '/posts/new' do
  if session[:user_id]
    erb :"posts/new"
  else
    redirect '/login'
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @responses = @post.responses
  erb :"post_detail"
end

post '/posts' do
  @post = Post.new(params[:post].merge(user_id: session[:user_id]))
  if @post.save
    redirect '/posts'
  else
    "error"
  end
end


