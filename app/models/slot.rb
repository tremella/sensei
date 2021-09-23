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
        end
    end

    # coach specific at the moment. Refactor, maybe?
    def slot_overlaps
        is_overlap = false
        Slot.all.each do |slot|
            if slot.coach_id == self.coach_id # REFAC: DRY
                if self.start >= slot.start && self.start <= slot.start + (60*30)
                    is_overlap = true
                elsif self.end >= slot.start && self.end <= slot.start + (60*30)
                    is_overlap = true
                else
                    next
                end
            end
        end
        return is_overlap
    end

    def prevent_creation
        throw :abort
    end

    def find_others_on_this_day(slot, params)
        puts 'finding...'
        if slot.coach_id == params[:coach_id].to_i
            if slot.start.to_s.slice(0,10) == params[:date].slice(0,10)
                puts 'found on this day ! ' + slot.start.to_s.slice(0,10) + '  ' + params[:date].slice(0,10)
            end
        end
    end

    # student specific (for now). REFAC: DRY
    def student_double_booked
        is_overlap = false
        Slot.all.each do |slot|
            if slot.id != self.id #ensure self doesn't assess against self
                if slot.student_id == self.student_id && self.student_id != nil #we've found all OUR other slots now.
                    # check for overlap
                    if self.start >= slot.start && self.start <= slot.start + (60*30)
                        is_overlap = true
                    elsif self.end >= slot.start && self.end <= slot.start + (60*30)
                        is_overlap = true
                    else
                        next
                    end
                end
            end
        end
        return is_overlap #true if overlap, false if not
    end


end
