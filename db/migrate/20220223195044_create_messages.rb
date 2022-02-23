class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.belongs_to :group
      t.text :body
      t.string :user_name
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
