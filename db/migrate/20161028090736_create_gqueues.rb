class CreateGqueues < ActiveRecord::Migration[5.0]
  def change
    create_table :gqueues do |t|
      t.string :name
      t.string :no
      t.string :locket_type

      t.timestamps
    end
  end
end
