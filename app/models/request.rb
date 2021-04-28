class Request < ApplicationRecord
  before_create :set_time_stamps

  validates :vacation_start_date, presence: true
  validates :vacation_end_date, presence: true

  belongs_to :worker

  enum status: %i[approved pending rejected]

  private

  def set_time_stamps
    self.request_created_at = DateTime.now
  end
end
