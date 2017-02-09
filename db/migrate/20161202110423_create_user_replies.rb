class CreateUserReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :user_replies do |t|
      t.references :online_test, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
