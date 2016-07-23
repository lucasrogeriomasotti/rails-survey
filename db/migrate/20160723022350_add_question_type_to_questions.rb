class AddQuestionTypeToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :question_type, :integer
  	remove_column :questions, :type, :string
  end
end
