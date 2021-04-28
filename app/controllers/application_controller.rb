class ApplicationController < ActionController::API
  def request_vacation_days(params)
    (params[:vacation_end_date].to_date - params[:vacation_start_date].to_date).to_int
  end
end
