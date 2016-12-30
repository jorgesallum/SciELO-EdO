class ProjectsController < ApplicationController
    def create
        project = Project.create(user: current_user)
        redirect_to root_url
    end

    def destroy
        Project.find(params[:id]).destroy
        redirect_to root_url
    end
end