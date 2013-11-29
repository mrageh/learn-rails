class VisitorsController < ApplicationController

  def new
    @owner = Owner.new
    Rails.logger.debug 'DEBUG: Owner name is ' + @owner.name
    flash.now[:alert] = "Welcome!"
  end

end
