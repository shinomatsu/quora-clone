
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
		redirect "/"
	end
end

post '/logout' do
	session[:user_id] = nil
	redirect "/"
end

get '/dashboard' do
	#get_current_user
	if logged_in?
		erb :'static/dashboard'
	else
		redirect '/login'
	end
	 # @current_user 
end

get "/users/:id" do
	@user = User.find(params[:id])
    erb :"users/profile"
end

