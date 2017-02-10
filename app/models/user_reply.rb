class UserReply < ApplicationRecord
  belongs_to :answer
  belongs_to :cart
end
