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
      puts 'NOPE'
    end
  end
  
  def book
    
  end

  def edit
    puts params[:task], '<<<PARAMS HERE'

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
    puts 'I AM IN DESTROY'
    puts 'I AM IN DESTROY'
    puts 'I AM IN DESTROY'
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

