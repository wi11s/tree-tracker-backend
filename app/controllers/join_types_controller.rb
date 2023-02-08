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
    @join_type = JoinType.new(join_type_params)

    if @join_type.save
      render json: @join_type, status: :created, location: @join_type
    else
      render json: @join_type.errors, status: :unprocessable_entity
    end
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
