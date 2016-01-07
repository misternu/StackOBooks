get '/posts' do
  @posts = Post.all
  erb :"posts/index"
end

get '/posts/new' do
  erb :"posts/new"
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


