class SubsController < ApplicationController

    before_action :verify_moderator, only: [:edit, :update]

    def index
        @subs = Sub.all
        render :index
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = current_user.subs.new(sub_params)
        if @sub.save
            flash[:notice] = 'Sub successfully created'
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update_attributes
            flash[:notice] = 'Sub updated'
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end

    def verify_moderator
        return if current_user.subs.find_by(id: params[:id])
        render json: 'You are not moderator', status: :forbidden
    end

end
