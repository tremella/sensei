class SlotsController < ApplicationController

  def index
    @slot = Slot.all.order("start ASC")
  end


  #only coaches can make a new slot.
  def new
    @slot = Slot.new(coach_id: current_user.id)
  end
  
  #implements creation
  def create
    @slot = Slot.new(slot_params)
    if @slot.save
      redirect_to @slot
    else
      flash[:notice] = 'uh oh! conflict with existing slot :('
      render :new
    end
  end
  
  def timeslices
    puts params
    @slots = Slot.all.order("start ASC")
    @slots.each do |slot|
      slot.tessa(slot.coach_id ,params[:coach_id].to_i)
      if slot.coach_id == params[:coach_id].to_i
        if slot.start.to_s.slice(0,10) == params[:date].slice(0,10)
          puts 'at least one slot exists on this day'
        end
      end
    end
    render :timeslices, layout: false
  end

  def edit
    @slot = Slot.find(params[:id])
    if params[:task] == 'cancel'
      @slot.update(is_booked: 0, student_id: '')
    elsif params[:task] == 'book'
      @slot.update(is_booked: 1, student_id: current_user.id)
    else #should not occur
      puts '...???'
    end
    redirect_to @slot
  end

  def update
    @slot = Slot.find(params[:id])

    if @slot.update(slot_params)
      redirect_to @slot
    else
      render :edit
    end
  end

  def destroy
    @slot = Slot.find(params[:id])
    @slot.destroy
    redirect_to "/"
  end

  def show
    @slot = Slot.find(params[:id])
    @coach = User.find(@slot.coach_id)
    if @slot.student_id
      @student = User.find(@slot.student_id)
    end
  end

  private
    def slot_params
      params.require(:slot).permit(:start, :end, :coach_id)
    end

end

