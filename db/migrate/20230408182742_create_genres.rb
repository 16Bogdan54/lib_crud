class CreateGenres < ActiveRecord::Migration[7.0]
  def change
    # Таблица "Жанры"
    create_table :genres do |t|
      t.string :name
      t.timestamps
    end
  end
end
