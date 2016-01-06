class CreateResponses < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :body
      t.reference :user

      t.timestamps
  end
end
