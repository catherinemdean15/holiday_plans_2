class Manager < ApplicationRecord
  has_many :managers_workers
  has_many :workers, through: :managers_workers
end
