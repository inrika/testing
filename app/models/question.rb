class Question < ApplicationRecord
  belongs_to :online_test
  has_many :answers
 # accepts_nested_attributes_for :answers
 end
