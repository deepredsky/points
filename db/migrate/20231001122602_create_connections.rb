class CreateConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :connections do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :other_id

      t.timestamps
    end
  end
end
