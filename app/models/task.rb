class Task < ApplicationRecord
    has_many :comments, as: :ta_duty
end
