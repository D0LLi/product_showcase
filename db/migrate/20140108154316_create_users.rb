class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :badge
      t.string :name

      t.timestamps
    end
  end
end
