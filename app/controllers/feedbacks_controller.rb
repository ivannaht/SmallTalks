class FeedbacksController < ApplicationController

  before_action :set_feedback, only: %i[ show edit update destroy ]

    def index
        @feedbacks = Feedback.all
    end

    def show
    end

  
    def new
      @feedback = Feedback.new
      
    end

    def edit
    end
  
    def already_give_feedback?
      Feedback.where(user_id: current_user.id).exists?
    end

    def create
      
        if already_give_feedback?
          flash[:notice] = "You can't give feedback more than once. But you can update your old feedback"
          redirect_to feedbacks_path
        else
          @feedback = Feedback.new(feedback_params)
         
      respond_to do |format|
        if @feedback.save
          format.html { redirect_to @feedback, notice: "Feedback was successfully added." }
          format.json { render :show, status: :created, location: @feedback }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @feedback.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
    def update
      respond_to do |format|
        if @feedback.update(feedback_params)
          format.html { redirect_to @feedback, notice: "Feedback was successfully updated." }
          format.json { render :show, status: :ok, location: @feedback }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @feedback.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @feedback.destroy
      respond_to do |format|
        format.html { redirect_to feedbacks_url, notice: "Feedback was successfully destroyed." }
        format.json { head :no_content }
      end
    end

   


    private
    
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    
    def feedback_params
      params.require(:feedback).permit(:recommendation, :experience, :user_id)
    end


end
