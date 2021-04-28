class Request < ApplicationRecord
  before_create :set_time_stamps

  belongs_to :worker

  enum status: %i[approved pending rejected]

  private

  def set_time_stamps
    self.request_created_at = DateTime.now
  end
end
