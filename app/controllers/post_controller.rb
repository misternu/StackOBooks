get '/posts' do
  @posts = Post.all
  erb :"posts"
end

get '/posts/new' do
  erb :"posts/new"
end

post '/posts' do
  @posts = Post.all
  Post.create(params[:post])
  erb :"posts/index"
end


get '/posts/:id' do
  @post = Post.find(params[:id])
  @responses = @post.responses
  erb :"post_detail"
end
