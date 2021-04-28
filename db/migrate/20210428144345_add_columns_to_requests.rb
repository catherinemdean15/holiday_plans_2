class AddColumnsToRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :requests, :author, foreign_key: { to_table: :workers }
    add_reference :requests, :resolved_by, foreign_key: { to_table: :managers }
  end
end
