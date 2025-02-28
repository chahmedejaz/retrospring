# frozen_string_literal: true

class QuestionController < ApplicationController
  include PaginatesAnswers

  def show
    @question = Question.find(params[:id])
    @answers = @question.cursored_answers(last_id: params[:last_id], current_user:)
    answer_ids = @answers.map(&:id)
    @answers_last_id = answer_ids.min
    @more_data_available = !@question.cursored_answers(last_id: @answers_last_id, size: 1, current_user:).count.zero?
    @subscribed = Subscription.where(user: current_user, answer_id: answer_ids).pluck(:answer_id) if user_signed_in?

    respond_to do |format|
      format.html
      format.turbo_stream { render layout: false, status: :see_other }
    end
  end
end
