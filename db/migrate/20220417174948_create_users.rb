class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :picture
      t.boolean :enabled

      t.timestamps
    end
  end
end
