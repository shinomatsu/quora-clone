class Questionvote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :question
    belongs_to :users

    validates :user_id,uniqueness: { scope: :question_id }

end
