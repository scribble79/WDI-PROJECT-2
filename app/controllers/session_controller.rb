# get a new session
get '/login' do 
  @user = User.new
  erb :'sessions/new'
  end

  #handle the form
post '/login' do 
  #find the user by their email address
  user = User.find_by_email(params[:user][:email])
  # if there is a user, check their password is correct
  if user && user.authenticate(params[:user][:password])
    #log the user in
    session[:user_id] = user.id
    flash[:success] = "Welcome!"
    redirect "/users/#{user.id}"
  else
  #otherwise render the login form again
  flash[:danger] = "Username or password incorrect"
  redirect "/login"
  end
end

#destroy the session
get '/logout' do 
  session.clear
  redirect "/login"
end