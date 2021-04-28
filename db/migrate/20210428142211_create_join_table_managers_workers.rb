class CreateJoinTableManagersWorkers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :managers, :workers do |t|
      t.references :manager, foreign_key: true
      t.references :worker, foreign_key: true

      t.timestamps
    end
  end
end
