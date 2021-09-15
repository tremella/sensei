class HomeController < ApplicationController
  def index
    @slots = Slot.all

  end
end
