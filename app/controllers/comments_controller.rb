class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  

  # GET /comments or /comments.json
  def index
    @talk = Talk.find(params[:talk_id])
    @comments = @talk.comments.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @talk = Talk.find(params[:talk_id])
    @comment = @talk.comments.new(parent_id: params[:parent_id])
    @comment.user = current_user
  end

  # GET /comments/1/edit
  def edit
    
  end

  # POST /comments or /comments.json
  

  def create
    @talk = Talk.find(params[:talk_id])
    @comment = @talk.comments.new(comment_params)
   @comment.user = current_user


    respond_to do |format|
      if @comment.save
        format.html { redirect_to @talk, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update    
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to @talk, notice: 'Comment was successfully updated.' }
          format.json { render :show, status: :ok, location: @comment }
        else
          format.html { render :edit }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :url => @new_talk_comment_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment  
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :talk_id, :parent_id)
    end
   
end
