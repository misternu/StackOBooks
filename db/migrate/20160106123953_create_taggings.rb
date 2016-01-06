class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.reference :user
      t.reference :tag

      t.timestamps
    end
  end
end
