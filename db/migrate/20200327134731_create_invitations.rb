class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :event, index: true
      t.references :sender, index: true
      t.references :receiver, index: true
      t.boolean :confirm, default: false
      t.datetime :confirm_at
      t.string :token

      t.timestamps
    end
  end
end
