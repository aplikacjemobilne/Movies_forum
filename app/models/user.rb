class User < ApplicationRecord
	has_and_belongs_to_many :movies, :join_table => :users_movies
	has_many :topics
	has_many :posts
end
