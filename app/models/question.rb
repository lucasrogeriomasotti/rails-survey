class Question < ActiveRecord::Base
  enum question_type: [:text, :single_choice, :multiple_choice, :rating_scale]
  belongs_to :survey
  has_many :answers, dependent: :restrict_with_error
  default_scope { order(:position) }
  validates :survey, :question_text, presence: true

  ANSWER_OPTIONS_DELIMITER = "\r\n"

  def options
    answer_options.split(ANSWER_OPTIONS_DELIMITER)
  end
end
