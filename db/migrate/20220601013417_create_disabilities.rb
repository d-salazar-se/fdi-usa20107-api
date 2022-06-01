class CreateDisabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :disabilities do |t|
      t.string :name

      t.timestamps
    end
  end
end
