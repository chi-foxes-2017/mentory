class CreatePairings < ActiveRecord::Migration[5.0]
  def change
    create_table :pairings do |t|
      t.integer :mentor_id, null:false
      t.integer :mentee_id
      t.datetime :start_time, null:false
      t.string :topic

      t.timestamps(null:false)
    end
  end
end
