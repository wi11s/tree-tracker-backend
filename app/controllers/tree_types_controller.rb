class TreeTypesController < ApplicationController
  before_action :set_tree_type, only: %i[ show update destroy ]

  # GET /tree_types
  def index
    @tree_types = TreeType.all

    render json: @tree_types
  end

  # GET /tree_types/1
  def show
    render json: @tree_type
  end

  # POST /tree_types
  def create
    @tree_type = TreeType.new(tree_type_params)

    if @tree_type.save
      render json: @tree_type, status: :created, location: @tree_type
    else
      render json: @tree_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tree_types/1
  def update
    if @tree_type.update(tree_type_params)
      render json: @tree_type
    else
      render json: @tree_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tree_types/1
  def destroy
    @tree_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tree_type
      @tree_type = TreeType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tree_type_params
      params.permit(:common_name, :image, :frequency)
    end
end
