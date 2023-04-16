class CreateUserReccords < ActiveRecord::Migration[7.0]
  def change
    create_table :user_reccords do |t|
      t.references :library, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
