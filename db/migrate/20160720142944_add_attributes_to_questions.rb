class AddAttributesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :type, :string
    add_column :questions, :question_text, :string
    add_column :questions, :answer_options, :text
    add_column :questions, :position, :integer
  end
end
