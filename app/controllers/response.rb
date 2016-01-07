get '/posts/:post_id/responses/new' do
  @respondable = Post.find(params[:post_id])
  erb :'responses/new'
end

post '/posts/:post_id/responses' do
  @respondable = Post.find(params[:post_id])
  response  = add_response(@respondable, params[:body]);
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
