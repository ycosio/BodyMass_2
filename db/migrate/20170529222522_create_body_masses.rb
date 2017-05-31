class CreateBodyMasses < ActiveRecord::Migration
  def change
    create_table :body_masses do |t|
      t.integer :user_id
      t.float :mass
      t.float :height
      t.string :category
      t.float :imc

      t.timestamps null: false
    end
  end
end
