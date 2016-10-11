class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project Created Successfully"
      redirect_to project_path(@project)
    else
      flash.now[:alert] = "Project has not been created"
      render :new
    end
  end

  def show
    @project = Project.find params[:id]
  end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
