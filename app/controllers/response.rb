get '/posts/:post_id/responses/new' do
  @respondable = Post.find(params[:post_id])
  erb :'responses/new'
end

post '/posts/:post_id/responses' do
  @respondable = Post.find(params[:post_id])
  response = Response.new(body: params[:body])
  response.comment = @respondable #come back later if/when .comment == .respondable
  if response.save
    redirect "/posts/#{params[:post_id]}"
  else
    @errors = @user.errors.full_messages
    erb :'responses/new'
  end
end

# get '/responses/:response_id/responses/new' do
#   @respondable = Response.find(params[:response_id])
#   erb :'responses/new'
# end

# post '/responses/:responses_id/responses' do
#   @respondable = Response.find(params[:response_id])
#   response = Response.new(body: params[:body])
#   response.comment = @respondable #come back later if/when .comment == .respondable
#   if response.save
#     redirect "/posts/#{@respondable}"
#   else
#     @errors = @user.errors.full_messages
#     erb :'responses/new'
#   end
# end
