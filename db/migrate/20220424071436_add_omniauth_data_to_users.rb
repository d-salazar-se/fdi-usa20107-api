class AddOmniauthDataToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :uid
      t.string :google_token
      t.string :google_refresh_token
    end
  end
end
