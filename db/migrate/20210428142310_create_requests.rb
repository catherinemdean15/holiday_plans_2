class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :author, index: true, foreign_key: { to_table: :workers }
      t.integer :status
      t.references :resolved_by, index: true, foreign_key: { to_table: :managers }
      t.datetime :vacation_start_date
      t.datetime :vacation_end_date
      t.datetime :request_created_at
    end
  end
end
