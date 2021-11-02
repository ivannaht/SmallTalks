class LikesController < ApplicationController
    before_action :find_talk
  def create
    @talk.likes.create(user_id: current_user.id)
    redirect_to talk_path(@talk)
  end
  private
  def find_talk
    @talk = Talk.find(params[:talk_id])
  end
end
