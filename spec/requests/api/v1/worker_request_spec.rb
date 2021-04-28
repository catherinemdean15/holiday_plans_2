require 'rails_helper'

describe 'Worker Request API' do
  it 'returns a specific worker requests' do
    worker = Worker.create!(name: 'Worker 1')
    Request.create!(status: 1,
                    vacation_start_date: '2020-08-24T00:00:00.000Z',
                    vacation_end_date: '2020-09-04T00:00:00.000Z',
                    worker_id: worker.id)

    get requests_api_v1_workers_path({ worker_id: worker.id })
    expect(response).to be_successful

    requests = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(requests.count).to eq(1)
    requests.each do |request|
      expect(request).to be_a(Hash)
      expect(request[:attributes]).to have_key(:worker_id)
      expect(request[:attributes][:worker_id]).to eq(worker.id)
      expect(request[:attributes][:status]).to eq('pending')
      expect(request[:attributes]).to have_key(:manager_id)
      expect(request[:attributes]).to have_key(:vacation_start_date)
      expect(request[:attributes]).to have_key(:vacation_end_date)
      expect(request[:attributes]).to have_key(:request_created_at)
    end
  end

  it 'returns a specific worker requests filtered by status' do
    worker = Worker.create!(name: 'Worker 1')
    Request.create!(status: 1,
                    vacation_start_date: '2020-08-24T00:00:00.000Z',
                    vacation_end_date: '2020-09-04T00:00:00.000Z',
                    worker_id: worker.id)
    Request.create!(status: 2,
                    vacation_start_date: '2020-08-24T00:00:00.000Z',
                    vacation_end_date: '2020-09-04T00:00:00.000Z',
                    worker_id: worker.id)
    Request.create!(status: 2,
                    vacation_start_date: '2020-08-24T00:00:00.000Z',
                    vacation_end_date: '2020-09-04T00:00:00.000Z',
                    worker_id: worker.id)
    # this would be a great place to use FactoryBot if time allows

    get requests_api_v1_workers_path({ worker_id: worker.id, status: 'rejected' })
    expect(response).to be_successful

    requests = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(requests.count).to eq(2)
    requests.each do |request|
      expect(request).to be_a(Hash)
      expect(request[:attributes]).to have_key(:worker_id)
      expect(request[:attributes][:worker_id]).to eq(worker.id)
      expect(request[:attributes][:status]).to eq('rejected')
      expect(request[:attributes]).to have_key(:manager_id)
      expect(request[:attributes]).to have_key(:vacation_start_date)
      expect(request[:attributes]).to have_key(:vacation_end_date)
      expect(request[:attributes]).to have_key(:request_created_at)
    end
  end
end
