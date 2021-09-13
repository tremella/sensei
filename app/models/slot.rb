class Slot < ApplicationRecord
    belongs_to :coach, class_name:'User', foreign_key:'coach_id'
end
