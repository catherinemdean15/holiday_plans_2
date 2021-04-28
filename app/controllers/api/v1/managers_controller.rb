class Api::V1::ManagersController < ApplicationController
  def requests
    manager = Manager.find(params[:manager_id])
    requests = if params[:status]
                 manager.workers.map do |worker|
                   worker.requests.where(status: params[:status])
                 end
               else
                 manager.workers.map do |worker|
                   worker.requests
                 end
               end.flatten
    render json: RequestSerializer.new(requests)
  end
end
