get '/votes' do
  @votes = Vote.all
  erb :"votes_all"
end

get '/responses/:response_id/votes/new' do
  erb :"vote_new"
end


post '/posts/votes/new' do
  puts params
  @vote = Vote.new(user_id: session[:user_id], response_id: params[:response_id])
  if @vote.save
    vote_count = Response.find(params[:response_id]).votes.count
    content_type :json
    { voteTally: vote_count }.to_json
  else
    "failure"
  end
end
