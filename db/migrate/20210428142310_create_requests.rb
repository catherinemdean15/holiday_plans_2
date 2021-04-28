class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :status
      t.datetime :vacation_start_date
      t.datetime :vacation_end_date
      t.datetime :request_created_at
    end
  end
end
