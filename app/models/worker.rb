class Worker < ApplicationRecord
  has_many :requests
  has_many :managers_workers
  has_many :managers, through: :managers_workers
end
