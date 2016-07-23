class Survey < ActiveRecord::Base
  has_many :questions

  def to_s
  	self.name
  end
end
