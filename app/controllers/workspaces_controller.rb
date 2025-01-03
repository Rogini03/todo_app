class WorkspacesController < ApplicationController
    before_action :set_workspace

    def create
        @workspace = Workspace.new(workspace_params)
        if @workspace.save
            render json: {message: "Workspace created", workspace: @workspace, status: :created}
        else
            render json: {errors: @workspace.errors.full_messages}, status: :unprocessable_entity
        end
    end
  
    def index
      @workspace = Workspace.all
      render json: @workspace
    end

    def add_member
        @workspace = Workspace.find(params[:id])
        @user = User.find(params[:user_id])
        if @workspace.add_member(@user)
          render json: { message: 'User added successfully' }, status: :ok
        else
          render json: { errors: @workspace.errors.full_messages }, status: :unprocessable_entity
        end
      end

    private
    def workspace_params
        params.require(:workspace).permit(:name, :url)
    end

    def set_workspace
      @workspace = request.headers['x-workspace']
    end

end
