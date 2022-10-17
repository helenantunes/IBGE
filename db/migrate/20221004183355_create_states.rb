class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.string :name
      t.string :initials
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
