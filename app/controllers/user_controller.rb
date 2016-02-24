#index
get '/users' do 
  authorize!  
  @users = User.all
  erb :'users/index'
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
    erb :'users/edit'
  end
end

# destroy
delete '/users/:id' do
  authorize!
  @user = User.find(params[:id])
  if @user.destroy
    session.clear
    redirect('/users')
  else 
    redirect "/users/#{@user.id}"
  end
end