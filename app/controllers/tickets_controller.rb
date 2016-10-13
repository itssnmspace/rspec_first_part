class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to project_ticket_path(@project, @ticket)
    else
      flash.now[:alert] = "Ticket has not been created."
      render :new
    end
  end

  def show

  end

  def edit

  end

  def destroy
    if @ticket.destroy
      flash[:notice] = "Ticket Deleted Successfuly"
      redirect_to project_path(@project)
    end
  end
  
  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket has been updated successfully"
      redirect_to project_ticket_path(@project, @ticket)
    else
      flash.now[:alert] = "Ticket has not been updated"
      render :edit
    end  
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_ticket
      @ticket = Ticket.find params[:id]
    end


  
    def ticket_params
      params.require(:ticket).permit(:name, :description)
    end  

end
