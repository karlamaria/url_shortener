class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :short_url
      t.string :long_url
      t.integer :clicks, :default => 0

      t.timestamps
    end

    add_index :links, :id, unique: true
  end
end
