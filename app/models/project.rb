class Project < ApplicationRecord
    belongs_to :user
    has_many :discussions, dependent: :destroy

end