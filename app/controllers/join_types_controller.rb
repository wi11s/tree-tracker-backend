class JoinTypesController < ApplicationController
  before_action :set_join_type, only: %i[ show update destroy ]

  # GET /join_types
  def index
    @join_types = JoinType.all

    render json: @join_types
  end

  # GET /join_types/1
  def show
    render json: @join_type
  end

  # POST /join_types
  def create
    join_type = JoinType.create(join_type_params)

    tree_types = TreeType.all
    for tree_type in tree_types
      if tree_type.users.include?(current_user) || params[:tree_type_id] == tree_type.id
        tree_type.collected = true
      else
        tree_type.collected = false
      end
    end
    render json: tree_types
  end

  # PATCH/PUT /join_types/1
  def update
    if @join_type.update(join_type_params)
      render json: @join_type
    else
      render json: @join_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /join_types/1
  def destroy
    @join_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_join_type
      @join_type = JoinType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def join_type_params
      params.permit(:user_id, :tree_type_id, :user_tree_id)
    end
end
