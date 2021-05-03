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
    worker = Worker.find(params[:id])
    render json: WorkerSerializer.new(worker, include: [:requests])
  end
end
