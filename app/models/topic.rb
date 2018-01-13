class Topic < ApplicationRecord
  belongs_to :student
  belongs_to :movie
  has_many :posts
end
