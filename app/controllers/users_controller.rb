
post '/signup' do

	@user = User.new(params[:user])

	if @user.save
	   @messages = "welcom!qqquora!"
	   erb :"users/new"

	else 
		@messages = @user.errors.full_messages.join(", ")
		erb :"static/index"
	end

end


post '/login' do 
	
	@user = User.find_by(email: params[:user][:email])
	if @user && @user.authenticate(params[:user][:password])
		session[:id] = @user.id
		 redirect "/users/#{@user.id}"
	else
		redirect "/login"
	end
end

post '/logout' do
	session[:id] = nil
	redirect "/"
end




get '/login' do
  @user = nil
  @messages = "Plese, login."
  erb :"static/index"
end


get "/users/:id" do

	if logged_in?

   @user = User.find(params[:id])
   erb :"users/profile"
   
  else
    redirect '/login'
  end

	
end
