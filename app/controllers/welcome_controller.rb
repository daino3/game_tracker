class WelcomeController < ApplicationController

  def index
    @sports = Sport.all
  end

end
