class SlotsController < ApplicationController

  def index
    @slot = Slot.all
  end

  def new
    puts 'INSIDE NEW'
    @slot = Slot.new(coach_id: current_user.id)
    
  end
  
  def create

    puts params
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
  end

  private
    def slot_params
      params.require(:slot).permit(:start, :end, :coach_id)
    end

end

