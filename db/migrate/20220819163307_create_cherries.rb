class CreateCherries < ActiveRecord::Migration[7.0]
  def change
    create_table :cherries do |t|
      t.string :npi
      t.string :name
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
