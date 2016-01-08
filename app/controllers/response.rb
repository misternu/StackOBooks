# form to create a new response on post
get '/posts/:post_id/responses/new' do
  @post = Post.find(params[:post_id])
  if session[:user_id]
    @respondable = Post.find(params[:post_id])
    erb :'responses/new'
  else
    erb :'/login'
  end
end

# form to create a new response on response
get '/posts/:post_id/responses/:response_id/response/new' do
  @post = Post.find(params[:post_id])
  @respondable = Response.find(params[:response_id])
  if session[:user_id]
    # @respondable = Post.find(params[:post_id])
    erb :'responses/new_on_resp'
  else
    erb :'/login'
  end
end

# create new response on response
post '/posts/:post_id/responses/:response_id/response' do
  @new_response = Response.new(body: params[:body], user_id: session[:user_id], comment_id: params[:response_id], comment_type: "Response");
  if @new_response.save
    redirect "/posts/#{params[:post_id]}"
  else
    "errors"
#     # @errors = response.errors.full_messages
#     erb :"responses/new"
  end
end

# create new response on post
post '/posts/:post_id/responses' do
  # @respondable = Post.find(params[:post_id])
  response  = Response.new(body: params[:body], user_id: session[:user_id], comment_id: params[:post_id], comment_type: "Post");
  if response.save
    redirect "/posts/#{params[:post_id]}"
  else
    @errors = response.errors.full_messages
    erb :'responses/new'
  end
end

get '/responses/:response_id/responses/new' do
  @respondable = Response.find(params[:response_id])
  erb :'responses/new'
end

post '/responses/:response_id/responses' do
  @respondable = Response.find(params[:response_id])
  response = add_response(@respondable, params[:body])
  if response.save
    redirect "/posts/#{@respondable.post_id}"
  else
    @errors = response.errors.full_messages
    erb :'responses/new'
  end
end

post '/responses/:id/favorite/new' do
  fave = Favorite.new(response_id: params[:response_id], post_id: params[:post_id])
  if fave.save
    "success"
  else
    "fail"
  end
end

get '/responses/:id/edit' do
  @foobar = Response.find(params[:id])
  @respondable = @foobar.comment
  erb :'responses/edit'
end

put '/responses/:id' do
  response = Response.find(params[:id])
  response.update(body: params[:body])
  redirect "/posts/#{response.post_id}"
end

delete '/responses/:id' do
  response = Response.find(params[:id])
  its_post = response.post_id
  response.destroy
  redirect "/posts/#{its_post}"
end
