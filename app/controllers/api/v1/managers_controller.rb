class Api::V1::ManagersController < ApplicationController
  def requests
    manager = Manager.find(params[:manager_id])
    requests = manager.requests(params[:status])
    render json: RequestSerializer.new(requests)
  end
end
