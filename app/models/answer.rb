class Answer < ActiveRecord::Base
	belongs_to :question
    belongs_to :answer_group
end
