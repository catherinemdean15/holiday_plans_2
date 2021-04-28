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
end
