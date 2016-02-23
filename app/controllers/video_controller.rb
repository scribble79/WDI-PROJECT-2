#index
get '/videos' do 
authorize!
  @videos = Video.all 
  erb :'videos/index'
end

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
  if @video.save
    redirect "/videos"
  else 
    erb :'videos/new'
    # erb :'users/index' && :'videos/index'
  end
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
  if @video.update(params[:user])
    redirect "/videos/#{@video.id}"
  else
    erb :'videos/show'
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