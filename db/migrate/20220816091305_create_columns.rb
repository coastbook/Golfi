class CreateColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :columns do |t|
      t.integer "user_id"
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
