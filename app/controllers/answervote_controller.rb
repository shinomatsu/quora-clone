post '/questions/:id/answers/:answer_id/upvote' do
  
  current_user
  @upvote = Answervote.new(
  answer_id: params[:answer_id],
  user_id: current_user.id,
  good_bad: params[:good]

  )
  if @upvote.save

  	redirect "/dashboard"

  else 

    @errors = @upvote.errors.full_messages.join(" ,") #capturing error messages thrown from validation tests udner app/models/question.rb
    all_posted
   erb :'questions/new'

  end

  	

end

post '/questions/:id/answers/:answer_id/downvote' do

  current_user
  @downvote = Answervote.new(
  answer_id: params[:answer_id],
  user_id: current_user.id,
  good_bad: params[:bad]

  )
  if @downvote.save

    redirect "/dashboard"
  else 

    @errors = @downvote.errors.full_messages.join(" ,") #capturing error messages thrown from validation tests udner app/models/question.rb
    all_posted
   erb :'questions/new'

  end
end