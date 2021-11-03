class HomeController < ApplicationController

  before_action :set_feedback, only: %i[ show ]
  
  def index
    @feedbacks = Feedback.all
  end

 end
