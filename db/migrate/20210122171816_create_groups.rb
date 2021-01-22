class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :members_n
      t.integer :members_gender
      t.string :name
      t.date :debut_date

      t.timestamps
    end
  end
end
