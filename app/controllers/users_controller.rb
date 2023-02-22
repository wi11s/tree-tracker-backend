class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :create_with_data, :index, :update]
    rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

    def me
        render json: current_user, status: :ok
    end

    def show
        user = User.find(params[:id])
        render json: user, status: :ok
    end

    def create 
        user = User.create!(user_params)
        @token = encode_token(user_id: user.id)
        render json: {
            user: UserSerializer.new(user), 
            token: @token
        }, status: :created
    end

    def index
        users = User.all
        render json: users
    end

    def index_with_id
        users = User.where.not(id: params[:user_id])
        # user = User.find(params[:user_id])
        for user in users do
            if Request.find_by(sender_id: params[:user_id], receiver_id: user.id)
                user.requested = true
            end
        end
        render json: users
    end

    def update
        User.find(params[:id]).update!(user_params)
        user = User.find(params[:id])
        render json: user
    end

    def score_update
        user = User.find(params[:user_id])
        new_score = user.score.to_i + params[:score].to_i
        user.update(score: new_score)
        render json: user
    end

    private

    def user_params 
        params.permit(:email, :username, :name, :password, :password_confirmation)
    end

    def handle_invalid_record(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end

