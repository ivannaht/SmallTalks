class MyTalksController < ApplicationController
 
  before_action :set_talk, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /my_talks or /talks.json
  def index
    @talks = Talk.all
  end

  def show
      end

 def new
   #@talk = Talk.new
   @talk = current_user.talks.build
 end     

  # GET /my_talks/1/edit
  def edit
  end

  # POST /my_talks or /my_talks.json
  def create
   # @talk = Talk.new(talk_params)
   @talk = current_user.talks.build(talk_params)

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

  # PATCH/PUT /my_talks/1 or /my_talks/1.json
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

  # DELETE /my_talks/1 or /my_talks/1.json
  def destroy
    @talk.destroy
    respond_to do |format|
      format.html { redirect_to talks_url, notice: "Talk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @talk = current_user.talks.find_by(id: params[:id])
    redirect_to my_talks_path, notice: "Not Authorized to Edit this Talk" if @talk.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talk
      @talk = Talk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def talk_params
      params.require(:talk).permit(:title, :text, :photo, :theme, :likes_number, :dislikes_number, :comments_number, :shares_number, :user_id)
    end
end



