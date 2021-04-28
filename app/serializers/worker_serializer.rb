class WorkerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :worker_id, :status, :resolved_by, :vacation_start_date, :vacation_end_date, :request_created_at
end
