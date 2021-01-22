class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.date :date
      t.integer :duration
      t.integer :assistance
      t.string :place
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
