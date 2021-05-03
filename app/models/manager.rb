class Manager < ApplicationRecord
  has_many :managers_workers
  has_many :workers, through: :managers_workers

  def requests(status)
    if status
      workers.map do |worker|
        worker.requests.where(status: status)
      end
    else
      workers.map do |worker|
        worker.requests
      end
    end.flatten
  end
end
