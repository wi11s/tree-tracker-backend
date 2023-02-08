class TreeTypesController < ApplicationController
  before_action :set_tree_type, only: %i[ show update destroy ]
  skip_before_action :authorized, only: [:index]

  def user_tree_types
    tree_types = TreeType.all
    for tree_type in tree_types
      if tree_type.users.include?(current_user)
        tree_type.collected = true
      else
        tree_type.collected = false
      end
    end
    render json: tree_types
  end

  def 

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
