post '/questions/:id/answers' do
  #if my helper has a current_user method that can return me who's the current log in user object
  current_user
  @answer = current_user.answers.new(
  	answer_description: params[:description],
  	question_id: params[:question_id])
  # by linking current_user.questions, i can save in the current logged in user id into my question object
  # automatically simply because their 1-many relationship has been astablished
  # params[:id]

  if @answer.save

    redirect "/questions/#{@answer.question_id}/answers/#{@answer.id}"
  else
    @errors = @answer.errors.full_messages.join(" ,") #capturing error messages thrown from validation tests udner app/models/question.rb
    erb :'static/new'
 
    
  end
end

get '/questions/:id' do

if logged_in?

    erb :'static/new'
  else
    redirect '/login'
  end

end

get '/questions/:question_id/answers/:id' do

if logged_in?

    erb :'static/new_answer'
  else
    redirect '/login'
  end

end

