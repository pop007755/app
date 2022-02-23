class User < ApplicationRecord
	has_many :members
	has_many :groups, through: :members
end
