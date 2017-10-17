class Question <ActiveRecord::Base
  belongs_to :user
  has_many :answers

     validates :question_description, presence:true
     validates :question_description, length: { in: 1..500 , message:"is not good."}


end