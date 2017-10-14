class CreateQuestions < ActiveRecord::Migration[5.0]
	def change
		create_table :questions do |t|
			t.string :question_description
			t.integer :user_id

			t.timestamps null: false


	end
end
end

