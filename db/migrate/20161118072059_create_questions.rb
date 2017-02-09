class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.references :online_test, foreign_key: true

      t.timestamps
    end
  end
end
