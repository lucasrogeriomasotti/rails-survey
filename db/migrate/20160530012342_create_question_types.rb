class CreateQuestionTypes < ActiveRecord::Migration
  def change
    create_table :question_types do |t|
      t.string :name
      t.boolean :rating_scale
      t.integer :rating_scale_start
      t.integer :rating_scale_end

      t.timestamps null: false
    end
  end
end
