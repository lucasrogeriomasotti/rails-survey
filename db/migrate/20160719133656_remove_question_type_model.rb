class RemoveQuestionTypeModel < ActiveRecord::Migration
  def change
  	drop_table :question_types
  	remove_column :questions, :question_type_id, :integer
  end
end
