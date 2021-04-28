class UpdateRequestStatusDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :status, :integer, default: 1
  end
end
