class CreateClubs < ActiveRecord::Migration[6.1]
  def change
    create_table :clubs do |t|
      t.integer "user_id"
      t.string :club_type
      t.string :club_name

      t.timestamps
    end
  end
end
