get '/posts' do
  @posts = Post.all
  erb :"posts"
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @responses = @post.responses
  erb :"post_detail"
end
