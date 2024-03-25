class Truetask < ApplicationRecord
    validates :done, inclusion: { in: [true, false] }
end
