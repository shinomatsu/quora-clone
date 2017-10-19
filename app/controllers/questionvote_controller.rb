post '/questions/:id/upvote' do
  
  current_user
  @upvote = Questionvote.new(
  question_id: params[:id],
  # user_id: current_user.id,
  good_bad: params[:good]

  )
  if @upvote.save
  	redirect '/dashboard'
  else 

    @errors = @upvote.errors.full_messages.join(" ,") #capturing error messages thrown from validation tests udner app/models/question.rb
    all_posted
    erb :'static/dashboard'

  end

  	

end

post '/questions/:id/downvote' do

  current_user
  @downvote = Questionvote.new(
  question_id: params[:id],
  # user_id: current_user.id,
  good_bad: params[:bad]

  )
  if @downvote.save
    redirect '/dashboard'
  else 
    @errors = @downvote.errors.full_messages.join(" ,") #capturing error messages thrown from validation tests udner app/models/question.rb
    all_posted
    erb :'static/dashboard'

  end

    

end