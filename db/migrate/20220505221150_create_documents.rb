class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :identifier
      t.jsonb :metadata
      t.integer :type, default: 0

      t.timestamps
    end
    add_index :documents, :identifier, unique: true
  end
end
