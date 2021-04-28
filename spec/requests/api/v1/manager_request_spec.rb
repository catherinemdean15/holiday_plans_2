require 'rails_helper'

describe 'Manager Request API' do
  before :each do
    # if time, use FactoryBot to clean up before each
    3.times do
      Worker.create!(name: 'Worker')
    end
    @workers = Worker.all
    @manager = Manager.create!(name: 'Manager')
    @workers.each do |worker|
      ManagersWorker.create(worker_id: worker.id, manager_id: @manager.id)
    end
    # if time, edge case testing for a worker not associated with this manager
  end

  it 'returns requests for the manager workers' do
    @workers.each do |worker|
      2.times do
        Request.create!(vacation_start_date: '2020-08-24T00:00:00.000Z',
                        vacation_end_date: '2020-09-04T00:00:00.000Z',
                        worker_id: worker.id)
      end
    end

    get requests_api_v1_managers_path({ manager_id: @manager.id })

    expect(response).to be_successful

    requests = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(requests.count).to eq(6)
  end

  it 'returns requests for the manager workers by status' do
    @workers.each do |worker|
      Request.create!(vacation_start_date: '2020-08-24T00:00:00.000Z',
                      vacation_end_date: '2020-09-04T00:00:00.000Z',
                      worker_id: worker.id,
                      status: 0)
    end

    @workers.each do |worker|
      Request.create!(vacation_start_date: '2020-08-24T00:00:00.000Z',
                      vacation_end_date: '2020-09-04T00:00:00.000Z',
                      worker_id: worker.id,
                      status: 1)
    end

    get requests_api_v1_managers_path({ manager_id: @manager.id, status: 'approved' })

    expect(response).to be_successful

    requests = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(requests.count).to eq(3)
  end

  it 'gives an overview of a worker' do
    @workers.each do |worker|
      Request.create!(vacation_start_date: '2020-08-24T00:00:00.000Z',
                      vacation_end_date: '2020-09-04T00:00:00.000Z',
                      worker_id: worker.id,
                      status: 0)
    end

    @workers.each do |worker|
      Request.create!(vacation_start_date: '2020-08-24T00:00:00.000Z',
                      vacation_end_date: '2020-09-04T00:00:00.000Z',
                      worker_id: worker.id,
                      status: 1)
    end

    get api_v1_worker_path({ id: @workers.first.id })

    expect(response).to be_successful

    requests = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(requests.count).to eq(2)
    expect(requests.first[:attributes][:worker_id]).to eq(@workers.first.id)
  end

  it 'can process a request' do
    @workers.each do |worker|
      Request.create!(vacation_start_date: '2020-08-24T00:00:00.000Z',
                      vacation_end_date: '2020-09-04T00:00:00.000Z',
                      worker_id: worker.id,
                      status: 0)
    end

    @workers.each do |worker|
      Request.create!(vacation_start_date: '2020-08-24T00:00:00.000Z',
                      vacation_end_date: '2020-09-04T00:00:00.000Z',
                      worker_id: worker.id,
                      status: 1)
    end

    patch api_v1_request_path({ id: Request.first.id, status: 'approved' })

    expect(response).to be_successful

    request = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(request[:attributes][:status]).to eq('approved')
  end

  # need sad path and edge case testing for update
end
