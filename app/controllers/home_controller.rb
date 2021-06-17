require 'will_paginate/array'
class HomeController < ApplicationController
  before_action :set_user, :set_data, :set_page

  def index
    @data_hash = @data.paginate(page: @page, per_page: 1)
  end

  def score
    @score = @user.submitted_scores.last
  end

  def submit_answer
    correct_answer = params["correct_answers"].include?(params["answer"])
    @score = @user.current_submission
    @score = @user.scores.create(correct_answers: 0, attempt: 1) unless @score.present?

    @score.correct_answers += 1 if correct_answer
    @score.save
    @score.answers.create(question: @page-1, answer: params["answer"], correct: correct_answer)

    if @page >= @data.length
      @score.update(submitted_at: Time.now)
      redirect_to "/score"
    else
      @data_hash = @data.paginate(page: @page, per_page: 1)
      redirect_to "/?page=#{@page}"
    end
  end

  def set_user
    @user = User.find_by(user_uuid: request.cookies["user_uuid"])
  end

  def set_data
    file = File.read('quiz.json')
    @data = JSON.parse(file)
  end

  def set_page
    @page ||= (params[:page] || 1)
    @page = @page.to_i
  end
end
