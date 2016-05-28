class MarksController < ApplicationController
  def create
    @mark = Mark.find_or_create_by(mark_params)

    respond_to do |format|
      format.json { render json: @mark }
    end
  end

  private

  def mark_params
    params.require(:mark).permit(:id, :forms_subject_id, :learner_id, :date, :value)
  end
end
