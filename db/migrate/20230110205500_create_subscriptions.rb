class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :customer, foreign_key: true
      
      t.string :title
      t.float :price
      t.string :status
      t.string :frequency

      t.timestamps
    end
  end
end
