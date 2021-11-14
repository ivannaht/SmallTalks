class TalksController < ApplicationController
 
  before_action :set_talk, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, only: :toggle_favorite
 

  # GET /talks or /talks.json
  def index
    @talks = Talk.all.order(cached_votes_score: :desc)
    @favorite_talks = current_user.favorited_by_type('Talk')
    
  end

  def upvote
    @talk = Talk.find(params[:id])
    if current_user.voted_up_on? @talk
      @talk.unvote_by current_user
    else
      @talk.upvote_by current_user
    end
    render "vote.js.erb"
  end

  def downvote
    @talk = Talk.find(params[:id])
    if current_user.voted_down_on? @talk
      @talk.unvote_by current_user
    else
      @talk.downvote_by current_user
    end
    render "vote.js.erb"
  end

  # GET /talks/1 or /talks/1.json
  def show
  end

  # GET /talks/new
  def new
    @talk = Talk.new
  end

  # GET /talks/1/edit
  def edit
  end

  # POST /talks or /talks.json
  def create
    @talk = Talk.new(talk_params)

    respond_to do |format|
      if @talk.save
        format.html { redirect_to @talk, notice: "Talk was successfully created." }
        format.json { render :show, status: :created, location: @talk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talks/1 or /talks/1.json
  def update
    respond_to do |format|
      if @talk.update(talk_params)
        format.html { redirect_to @talk, notice: "Talk was successfully updated." }
        format.json { render :show, status: :ok, location: @talk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talks/1 or /talks/1.json
  def destroy
    @talk.destroy
    respond_to do |format|
      format.html { redirect_to talks_url, notice: "Talk was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def toggle_favorite 
      
    @talk = Talk.find(params[:id])
    current_user.favorited?(@talk) ? current_user.unfavorite(@talk) : current_user.favorite(@talk)
    redirect_to talks_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talk
      @talk = Talk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def talk_params
      params.require(:talk).permit(:title, :text, :photo, :theme, :user_id)
    end

    

end
