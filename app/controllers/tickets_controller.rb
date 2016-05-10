class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_signin!, except:[:show, :index]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(ticket_params)

    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket has been updated."
      
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      
      render action: "edit"
    end
  end

  def destroy
    @ticket.destroy

    flash[:notice] = "Ticket has been deleted."

    redirect_to @project
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end

  def require_signin!
    if current_user.nil?
      flash[:error] = 
      "You need to sign in or sign up before continuing."
      redirect_to signin_url
    end
  end
  helper_method :require_signin!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
end