#index
get '/users' do 
authorize!
  @users = User.all 
  erb :'users/index'
end

#new
get '/users/new' do
authorize! 
  @user = User.new 
  erb :'users/new'
end

#create
post '/users' do 
  authorize!
  @user = User.new(params[:user])
  if @user.save
    redirect "/users"
  else 
    erb :'users/new'
  end
end

#show
get '/users/:id' do 
  authorize!
  @user = User.find(params[:id])
  if @user
    erb :'users/show'
  else
    redirect "/users"
  end
end

#edit
get "/users/:id/edit" do 
  authorize!
  @user = User.find(params[:id])
  erb :'users/edit'
end

#update
put '/users/:id' do 
  authorize!
  @user = User.find(params[:id])
  if @user.update(params[:user])
    redirect "/users/#{@user.id}"
  else
    erb :'users/show'
  end
end

# destroy
delete '/users/:id' do
  authorize!
  @user = User.find(params[:id])
  if @user.destroy
    redirect('/users')
  else 
    redirect "/users/#{@user.id}"
  end
end