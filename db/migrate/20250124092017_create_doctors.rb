class CreateDoctors < ActiveRecord::Migration[8.0]
  def change
    create_table :doctors do |t|
      t.string :fullname
      t.string :specialization
      t.integer :experience

      t.timestamps
    end
  end
end
