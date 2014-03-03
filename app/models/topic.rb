class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :public, :posts
  has_many :posts, dependent: :destroy
end
