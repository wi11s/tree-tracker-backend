class UserTreesController < ApplicationController
  before_action :set_user_tree, only: %i[ show update destroy ]

  # GET /user_trees
  def index
    @user_trees = UserTree.all

    render json: @user_trees
  end

  # GET /user_trees/1
  def show
    render json: @user_tree
  end

  # POST /user_trees
  def create
    @user_tree = UserTree.new(user_tree_params)

    if @user_tree.save
      render json: @user_tree, status: :created, location: @user_tree
    else
      render json: @user_tree.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_trees/1
  def update
    if @user_tree.update(user_tree_params)
      render json: @user_tree
    else
      render json: @user_tree.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_trees/1
  def destroy
    @user_tree.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_tree
      @user_tree = UserTree.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_tree_params
      params.require(:user_tree).permit(:pet_name, :common_name, :scientific_name, :wiki, :image, :lat, :lng, :health, :description, :user_id)
    end
end
