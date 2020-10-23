class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    @nail = Nail.find(params[:nail_id])
    now = Time.current
    nail_ranking = Comment.where(created_at: Time.now.all_month).group(:nail_id).order("avg(comments.rate) desc").limit(3).pluck("nail_id,avg(comments.rate)")
      @nail_ranking = nail_ranking.map do |r|
        {
          nail:Nail.find(r[0]),
          average:r[1]
        }
      end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @nail = Nail.find(params[:nail_id])
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.nail_id = @nail.id

  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @nail = Nail.find(params[:nail_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.nail_id = @nail.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to nail_comments_path, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
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
      params.permit(:user_id, :nail_id, :rate, :title, :content)
    end
end
