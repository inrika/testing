class AddOnlineTestToCart < ActiveRecord::Migration[5.0]
  def change
    add_reference :carts, :online_test, foreign_key: true
  end
end
