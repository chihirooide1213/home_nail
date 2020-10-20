class NailsController < ApplicationController
  before_action :set_nail, only: [:show, :edit, :update, :destroy]

  # GET /nails
  # GET /nails.json
  def index
    @nails = Nail.all
  end

  # GET /nails/1
  # GET /nails/1.json
  def show
    @nail = Nail.find(params[:id])
  end

  # GET /nails/new
  def new
    @nail = Nail.new
  end

  # GET /nails/1/edit
  def edit
  end

  # POST /nails
  # POST /nails.json
  def create
    @nail = Nail.new(nail_params)

    respond_to do |format|
      if @nail.save
        format.html { redirect_to @nail, notice: 'Nail was successfully created.' }
        format.json { render :show, status: :created, location: @nail }
      else
        format.html { render :new }
        format.json { render json: @nail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nails/1
  # PATCH/PUT /nails/1.json
  def update
    respond_to do |format|
      if @nail.update(nail_params)
        format.html { redirect_to @nail, notice: 'Nail was successfully updated.' }
        format.json { render :show, status: :ok, location: @nail }
      else
        format.html { render :edit }
        format.json { render json: @nail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nails/1
  # DELETE /nails/1.json
  def destroy
    @nail.destroy
    respond_to do |format|
      format.html { redirect_to nails_url, notice: 'Nail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nail
      @nail = Nail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nail_params
      params.require(:nail).permit(:relationship_id, :user_id, :name, :image, :brand, :introduction, :price)
    end
end
