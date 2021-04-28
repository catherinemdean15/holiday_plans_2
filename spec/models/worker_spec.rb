require 'rails_helper'

RSpec.describe Worker, type: :model do
  describe 'relationships' do
    it { should have_many :requests }
    it { should have_many :managers_workers }
    it { should have_many(:managers).through(:managers_workers) }
  end

  describe 'instance methods' do
    it "shows a worker's remaining vacation days" do
      worker = Worker.create!(name: 'Worker 1')
      Request.create!(status: 0,
                      vacation_start_date: '2021-07-24T00:00:00.000Z',
                      vacation_end_date: '2021-08-04T00:00:00.000Z',
                      worker_id: worker.id)
      Request.create!(status: 0,
                      vacation_start_date: '2021-08-24T00:00:00.000Z',
                      vacation_end_date: '2021-09-04T00:00:00.000Z',
                      worker_id: worker.id)
      Request.create!(status: 2,
                      vacation_start_date: '2021-09-24T00:00:00.000Z',
                      vacation_end_date: '2021-10-04T00:00:00.000Z',
                      worker_id: worker.id)

      expect(worker.remaining_vacation_days).to eq(8)
    end
  end
end
