class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :password_digest
      t.integer :role, default: 1, comment: "1: 'user', 2: 'admin'"
      t.integer :status, default: 1, comment: "1: 'active', 2: 'block'"

      t.timestamps
    end
  end
end
