class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :f_name
      t.string :l_name
      t.integer :user_id

      t.timestamps
    end
  end
end
