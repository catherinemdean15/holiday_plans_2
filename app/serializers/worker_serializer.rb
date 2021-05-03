class WorkerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :requests, serializer: RequestSerializer
end
