class FormJournalsController < ApplicationController
  def index
    @forms = Form.all
  end

  def show
  end
end
