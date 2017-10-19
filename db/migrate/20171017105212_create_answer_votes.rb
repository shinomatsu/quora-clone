class CreateAnswerVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :answervotes do |t|
			t.integer :user_id
			t.integer :answer_id
			t.integer :good_bad

			t.timestamps null: false

	end
end
end