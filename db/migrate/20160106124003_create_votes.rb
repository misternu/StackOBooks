class CreateVotes < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.reference :user
      t.reference :response

      t.timestamps
  end
end
