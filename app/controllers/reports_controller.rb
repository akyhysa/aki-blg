class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  
  def show
    @reports = Report.paginate(page: params[:page], per_page: 5)
    @random = Report.order("RAND()").limit(6)
  end

  
  def index
    @reports = Report.paginate(page: params[:page], per_page: 5)
    @random = Report.order("RAND()").limit(6)
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    if @report.save
      flash[:notice] = "Report was created successfully."
      redirect_to @report
    else
      render 'new'
    end
  end

  def update
    if @report.update(report_params)
      flash[:notice] = "Report was updated successfully."
      redirect_to @report
    else
      render 'edit'
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :description, :image)
  end

  def require_same_user
    if current_user != @report.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own report"
      redirect_to @report
    end
  end

end
