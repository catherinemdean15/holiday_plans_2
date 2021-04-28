require 'rails_helper'

describe 'Request API' do
  it 'creates a request' do
    worker = Worker.create!(name: 'Worker 1')
    data = {
      worker_id: worker.id,
      vacation_start_date: '2020-08-24T00:00:00.000Z',
      vacation_end_date: '2020-09-04T00:00:00.000Z'
    }
    post api_v1_requests_path(data)
    expect(response).to be_successful
    request = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(request[:attributes][:worker_id]).to eq(worker.id)
    expect(request[:attributes][:vacation_start_date]).to eq(data[:vacation_start_date])
    expect(request[:attributes][:vacation_end_date]).to eq(data[:vacation_end_date])
    expect(request[:attributes][:status]).to eq('pending')
  end

  it 'throws an error if vacation_start_date or vacation_end_date is not included' do
    worker = Worker.create!(name: 'Worker 1')
    data = {
      worker_id: worker.id,
      vacation_end_date: '2020-09-04T00:00:00.000Z'
    }
    post api_v1_requests_path(data)
    expect(response).to_not be_successful
    request = JSON.parse(response.body, symbolize_names: true)
    expect(request[:error]).to eq('something went wrong')

    worker = Worker.create!(name: 'Worker 1')
    data = {
      worker_id: worker.id,
      vacation_start_date: '2020-09-04T00:00:00.000Z'
    }
    post api_v1_requests_path(data)
    expect(response).to_not be_successful
    request = JSON.parse(response.body, symbolize_names: true)
    expect(request[:error]).to eq('something went wrong')
  end

  it 'throws an error if worker does not have enough vacation days' do
    worker = Worker.create!(name: 'Worker 1')
    2.times do
      Request.create!(status: 0,
                      vacation_start_date: '2020-08-24T00:00:00.000Z',
                      vacation_end_date: '2020-09-04T00:00:00.000Z',
                      worker_id: worker.id)
    end
    data = {
      worker_id: worker.id,
      vacation_start_date: '2020-08-24T00:00:00.000Z',
      vacation_end_date: '2020-09-04T00:00:00.000Z'
    }
    post api_v1_requests_path(data)
    expect(response).to_not be_successful
    request = JSON.parse(response.body, symbolize_names: true)
    expect(request[:error]).to eq('you do not have enough vacation days left')
  end
end
