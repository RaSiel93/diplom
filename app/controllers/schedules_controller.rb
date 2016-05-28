class SchedulesController < ApplicationController
  def show
    @forms = Form.all
  end
end
