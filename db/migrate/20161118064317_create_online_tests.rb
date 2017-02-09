class CreateOnlineTests < ActiveRecord::Migration[5.0]
  def change
    create_table :online_tests do |t|
      t.string :title

      t.timestamps
    end
  end
end
