class Checkbox < Question
  validates :answer_options, :presence => true

  def options
    answer_options.split("\r\n")
  end

end
