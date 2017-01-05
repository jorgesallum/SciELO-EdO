class ProjectsController < ApplicationController
    def create
        project = Project.create(user: current_user)
        redirect_to root_url
    end

    def destroy
        Project.find(params[:id]).destroy
        redirect_to root_url
    end

    def upload
        project = Project.find(params[:id])
        content = project.add_upload_file(params[:document])
        render html: content.html_safe
    end
end