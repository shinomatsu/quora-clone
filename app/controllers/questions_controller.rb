post '/questions' do
  #if my helper has a current_user method that can return me who's the current log in user object
  current_user
  @question = current_user.questions.new(question_description: params[:description])
  # by linking current_user.questions, i can save in the current logged in user id into my question object
  # automatically simply because their 1-many relationship has been astablished

  if @question.save

    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages.join(" ,") #capturing error messages thrown from validation tests udner app/models/question.rb

    #flash[:error] = @errors
    #redirect "/questions/dashboard"
    erb :'static/dashboard'
    
  end

end

get '/questions/:id' do
  erb :'static/new'
end

get '/dashboard' do
   @posted_questions = Question.all
  
  if logged_in?
    erb :'static/dashboard'
  else
    redirect '/login'
  end
   # @current_user 
end