class Slot < ApplicationRecord
    belongs_to :coach, class_name:'User', foreign_key:'coach_id'

    before_create do
        self.end = self.start + (60 * 30)
        if slot_overlaps
            prevent_creation
        end
    end

    def slot_overlaps
        dupe = false
        slots = Slot.all 
        slots.each do |slot|
            if slot.coach_id == self.coach_id
                if self.start >= slot.start && self.start <= slot.start + (60*30)
                    dupe = true
                elsif self.end >= slot.start && self.end <= slot.start + (60*30)
                    dupe = true
                else
                    next
                end
            end
        end
        return dupe
    end

    def prevent_creation
        throw :abort
    end


end
