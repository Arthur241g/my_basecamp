class Message < ApplicationRecord
  belongs_to :discussion
  belongs_to :user
end
