class Api::TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :update, :destroy]

  # GET /api/tutorials
  def index
    @tutorials = if params[:title]
                   Tutorial.where('title LIKE ?', "%#{params[:title]}%")
                 else
                   Tutorial.all
                 end

    render json: @tutorials
  end

  # GET /api/tutorials/1
  def show
    render json: @tutorial
  end

  # POST /api/tutorials
  def create
    @tutorial = Tutorial.new(tutorial_params)

    if @tutorial.save
      render json: @tutorial, status: :created, location: api_tutorial_url(@tutorial)
    else
      render json: @tutorial.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/tutorials/1
  def update
    if @tutorial.update(tutorial_params)
      render json: @tutorial
    else
      render json: @tutorial.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/tutorials/1
  def destroy
    @tutorial.destroy
  end

  def destroy_all
    Tutorial.destroy_all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tutorial
    @tutorial = Tutorial.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tutorial_params
    params.require(:tutorial).permit(:title, :description, :published_status)
  end
end
