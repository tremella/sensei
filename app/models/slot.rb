class Slot < ApplicationRecord
    belongs_to :coach, class_name:'User', foreign_key:'coach_id'

    before_create do
        self.end = self.start + (60 * 30)
    end

end
