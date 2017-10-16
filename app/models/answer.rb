class Answer <ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :answer_description, presence:true
  validates :answer_description, length: { in: 1..500 }

end


