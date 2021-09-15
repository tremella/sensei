class SlotsController < ApplicationController

  def index
    @slot = Slot.all
  end

  #only coaches can make a new slot.
  def new
    @slot = Slot.new(coach_id: current_user.id)
  end
  
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
    @slots = Slot.all
  end

  def destroy
  end

  def show
    @slot = Slot.find(params[:id])
    @coach = User.find(@slot.coach_id)
    puts @coach.nickname, 'HERE'
  end

  private
    def slot_params
      params.require(:slot).permit(:start, :end, :coach_id)
    end

end

