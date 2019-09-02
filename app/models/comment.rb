class Comment < ApplicationRecord
    belongs_to :ta_duty, polymorphic: true
    has_many :comments, as: :ta_duty
end
