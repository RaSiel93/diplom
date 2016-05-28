class StatisticsController < ApplicationController
  def show
    @forms = Form.all
  end
end
