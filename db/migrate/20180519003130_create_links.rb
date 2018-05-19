class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :longURL
      t.integer :clicks, :default => 0

      t.timestamps
    end

    add_index :links, :id, unique: true
  end
end
