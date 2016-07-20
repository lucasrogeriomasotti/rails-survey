class Question < ActiveRecord::Base
  belongs_to :survey
  default_scope { order(:position) }
  validates :survey, :question_text, presence: true
end
