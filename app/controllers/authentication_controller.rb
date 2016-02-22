# get the form
get '/register' do 
  @user = User.new
  erb :'authentications/new'

end

# handle the form
post '/register' do 
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id 
    flash[:success] = "Shout it loud, shout it proud!"
    redirect '/users'
  else
    erb :'authentications/new'
  end
end