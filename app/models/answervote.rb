class Answervote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :answer
    belongs_to :user

    validates :user_id,uniqueness: { scope: :question_id }

    # answer_vote AnswerVote
    # answervote  Answervote
end

