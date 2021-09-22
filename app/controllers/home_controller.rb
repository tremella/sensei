class HomeController < ApplicationController
  def index
    @slots = Slot.all.order("start ASC")

  end
end
