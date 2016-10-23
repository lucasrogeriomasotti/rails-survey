class Survey < ActiveRecord::Base
  has_many :questions, dependent: :restrict_with_error

  def user_can_answer? user
  	true
  end

  def to_s
  	self.name
  end
end
