class Question < ActiveRecord::Base
  enum question_type: [:text, :single_choice, :multiple_choice, :rating_scale]
  belongs_to :survey
  default_scope { order(:position) }
  validates :survey, :question_text, presence: true
end
