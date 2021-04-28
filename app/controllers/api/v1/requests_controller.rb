class Api::V1::RequestsController < ApplicationController
  def create
    request = Request.new(request_params)
    if request.save
      unless Worker.find(params[:worker_id]).remaining_vacation_days > (request_vacation_days(params))
        render json: { error: 'you do not have enough vacation days left' }, status: :conflict
        request.delete
        exit
      end
      render json: RequestSerializer.new(request)
    else
      render json: { error: 'something went wrong' }, status: :conflict
    end
  end

  def update
    request = Request.find(params[:id])
    if request.update(request_params)
      render json: RequestSerializer.new(request), status: :accepted
    else
      render json: { error: 'something went wrong' }, status: :not_found
    end
  end

  private

  def request_params
    params.permit(:vacation_start_date, :vacation_end_date, :worker_id)
  end
end
