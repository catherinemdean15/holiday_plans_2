class Request < ApplicationRecord
  belongs_to :worker

  enum status: %i[approved pending rejected]
end
