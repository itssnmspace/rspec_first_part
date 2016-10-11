class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :show, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project Updated Successfully"
      redirect_to project_path(@project)
    else
      flash.now[:alert] = "Project Has Not Been Updated"
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = "Project Deleted Successfully"
      redirect_to projects_path
    else
    
    end  
  end  

  private
    def set_project
      @project = Project.find params[:id]
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end
end
