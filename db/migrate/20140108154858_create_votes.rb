class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :category
      t.string :product
      t.references :ballot, index: true

      t.timestamps
    end
  end
end
