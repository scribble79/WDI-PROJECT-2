get "/videos" do

  if params[:search] && !params[:search].empty?
    @videos = Video.where("video_name ILIKE :search OR url ILIKE :search OR user_id ILIKE :search", { search: "%#{params[:search]}%" })
  else
    authorize!
    @videos = Video.all
  end

  erb :'videos/index'
end



# #index
# get '/videos' do 
# authorize!
#   @videos = Video.all 
#   erb :'videos/index'
# end

#new
get '/videos/new' do
authorize! 
  @video = Video.new 
  erb :'videos/new'
end

#create
post '/videos' do 
  authorize!
  @video = Video.new(params[:video])
  @video.user = current_user
  if @video.save
    redirect "/videos"
  else 
    erb :'videos/index'
  end
end

post '/videos' do
  authorize!
  @video = Video.new(params[:comments])
  if @video.save
    redirect "/videos"
  else
    erb :'videos/index'
  end
end

post '/videos/:id/comment' do
  comment = Comment.new(params[:comment])
  comment.save
  redirect "/videos/#{comment.video_id}"
end

#show
get '/videos/:id' do 
  authorize!
  @video = Video.find(params[:id])
  if @video
    erb :'videos/show'
  else
    redirect "/videos"
  end
end

#edit
get "/videos/:id/edit" do 
  authorize!
  @video = Video.find(params[:id])
  erb :'videos/edit'
end

#update
put '/videos/:id' do 
  authorize!
  @video = Video.find(params[:id])
  if @video.update(params[:video])
    redirect "/videos/#{@video.id}"
  else
    erb :'videos/edit'
  end
end



# destroy
delete '/videos/:id' do
  authorize!
  @video = Video.find(params[:id])
  if @video.destroy
    redirect('/videos')
  else 
    redirect "/videos/#{@video.id}"
  end
end