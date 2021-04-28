class ManagersWorker < ApplicationRecord
  belongs_to :manager
  belongs_to :worker
end
