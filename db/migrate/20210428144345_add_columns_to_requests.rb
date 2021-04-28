class AddColumnsToRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :requests, :worker, foreign_key: true
  end
end
