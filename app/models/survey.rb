class Survey < ActiveRecord::Base
  has_many :questions

  def user_can_answer? user
  	true
  end

  def to_s
  	self.name
  end
end
