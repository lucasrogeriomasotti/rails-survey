class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :description
      t.references :question_type, index: true, foreign_key: true, null: false
      t.references :survey, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
