class LikesController < ApplicationController
    before_action :find_talk
    before_action :find_like, only: [:destroy]
  
    def already_liked?
        Like.where(user_id: current_user.id, talk_id:
        params[:talk_id]).exists?
    end  
  
    def create
        if already_liked?
        flash[:notice] = "You can't like more than once"
      else
        @talk.likes.create(user_id: current_user.id)
      end
      redirect_to talk_path(@talk)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to talk_path(@talk)
  end

  private
  def find_talk
    @talk = Talk.find(params[:talk_id])
  end


  def find_like
    @like = @talk.likes.find(params[:id])
  end

  


 
end
