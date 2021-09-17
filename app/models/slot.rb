class Slot < ApplicationRecord
    belongs_to :coach, class_name:'User', foreign_key:'coach_id'

    # handling 'coach makes slot'
    before_create do
        self.end = self.start + (60 * 30)
        if slot_overlaps
            prevent_creation
        end
    end

    # handling 'student books slot'/'student cancels slot'
    before_update do #this actually means 'after update but before save'
        if student_double_booked#making this more like 'if we 'try' book it'
            prevent_creation
            puts 'OUTCOME!!!!'
        end
    end

    # coach specific at the moment. Refactor, maybe?
    def slot_overlaps
        is_overlap = false
        slots = Slot.all 
        slots.each do |slot|
            if slot.coach_id == self.coach_id #|| slot.student_id == self.student_id
                if self.start >= slot.start && self.start <= slot.start + (60*30)
                    is_overlap = true
                elsif self.end >= slot.start && self.end <= slot.start + (60*30)
                    is_overlap = true
                else
                    next
                end
            end
        end
        puts 'HERE 1 '
        return is_overlap
    end

    def prevent_creation
        throw :abort
    end

    # student specific (for now). Maybe merge with slot_overlaps if I refactor it.
    def student_double_booked
        is_overlap = false
        slots = Slot.all
        slots.each do |slot|
            if slot.id != self.id #ensure self doesn't assess against self
                if slot.student_id == self.student_id && self.student_id != nil#we've found all OUR other slots now.
                    # check for overlap
                    print '**',self.id, self.student_id, 'vs', slot.id, slot.student_id, '**' 
                    # puts self.student_id == nil
                    if self.start >= slot.start && self.start <= slot.start + (60*30)
                        is_overlap = true
                    elsif self.end >= slot.start && self.end <= slot.start + (60*30)
                        is_overlap = true
                    else
                        next
                    end
                end
                # if we overlap, return true
            end
        end
        return is_overlap
    end


end
