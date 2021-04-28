class Worker < ApplicationRecord
  has_many :requests
  has_many :managers_workers
  has_many :managers, through: :managers_workers

  def remaining_vacation_days
    requests = self.requests.where(status: 'approved')
    total_days_approved = 0
    requests.each do |request|
      # subtract the beginning date from the end date and divide by number of seconds in a day
      total_days_approved += (request.vacation_end_date - request.vacation_start_date) / 86_400
    end
    # this assumes requests will be archived at the beginning of every year
    30 - total_days_approved
  end
end
