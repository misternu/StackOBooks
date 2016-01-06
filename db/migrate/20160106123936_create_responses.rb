class CreateResponses < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :body
      t.reference :user
      t.integer :comment_id
      t.string :comment_type

      t.timestamps
  end
end
