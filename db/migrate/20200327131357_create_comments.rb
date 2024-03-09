class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment_text
      t.bigint  :commentable_id
      t.string  :commentable_type
      t.references :user, index: true

      t.timestamps
    end
  end
end
