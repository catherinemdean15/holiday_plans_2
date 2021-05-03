require 'rails_helper'

RSpec.describe Manager, type: :model do
  describe 'relationships' do
    it { should have_many :managers_workers }
    it { should have_many(:workers).through(:managers_workers) }
  end
  describe 'instance methods' do
    it 'requests' do
      2.times do
        Worker.create!(name: 'Worker')
      end
      @workers = Worker.all
      @manager = Manager.create!(name: 'Manager')
      @workers.each do |worker|
        ManagersWorker.create(worker_id: worker.id, manager_id: @manager.id)
      end
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
      status = 'approved'
      nil_status = nil

      expect(@manager.requests(status).count).to eq(2)
      expect(@manager.requests(nil_status).count).to eq(4)
    end
  end
end
