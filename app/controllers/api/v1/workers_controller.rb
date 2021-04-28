class Api::V1::WorkersController < ApplicationController
  def requests
    worker = Worker.find(params[:worker_id])
    requests = if params[:status]
                 worker.requests.where(status: params[:status])
               else
                 worker.requests
               end
    render json: RequestSerializer.new(requests)
  end

  def remaining_vacation_days
    days = Worker.find(params[:worker_id]).remaining_vacation_days
    render json: { remaining_vacation_days: days }
  end

  def show
    # ideally should show both worker info (name), and requests
    # use options for FastJsonapi
    requests = Worker.find(params[:id]).requests
    render json: RequestSerializer.new(requests)
  end
end
