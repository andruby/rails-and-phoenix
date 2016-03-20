class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.string :presenter

      t.timestamps null: false
    end
  end
end
