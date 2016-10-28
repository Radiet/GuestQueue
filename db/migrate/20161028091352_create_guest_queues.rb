class CreateGuestQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :guest_queues do |t|
      t.string :name
      t.string :no
      t.string :ticket_type

      t.timestamps
    end
  end
end
