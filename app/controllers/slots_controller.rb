class SlotsController < ApplicationController

  def index
    @slot = Slot.all
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
      render :new
      puts 'NOPE NOPE NOPE'
    end
  end
  
  def book
    
  end

  def edit
    puts params, 'PARAMS HERE'
    @slot = Slot.find(params[:id])
    @slot.update(is_booked: 1, student_id: current_user.id)
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

