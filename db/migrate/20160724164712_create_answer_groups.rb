class CreateAnswerGroups < ActiveRecord::Migration
  def change
    create_table :answer_groups do |t|
      t.references :survey, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
    end
  end
end
