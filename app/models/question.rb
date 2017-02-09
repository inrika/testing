class Question < ApplicationRecord
  belongs_to :online_test
  has_many :answers
  #has_many :user_replies
 # accepts_nested_attributes_for :answers
 end
