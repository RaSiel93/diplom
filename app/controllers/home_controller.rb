class HomeController < ApplicationController
  before_action :authenticate_user!

  def profile
  end

  def schedule
  end

  def marks
  end
end
