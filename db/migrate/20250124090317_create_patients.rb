class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :fullname
      t.integer :age
      t.string :phone

      t.timestamps
    end
  end
end
