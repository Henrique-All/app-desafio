class CreateConsents < ActiveRecord::Migration[7.0]
  def change
    create_table :consents do |t|
      t.references :user, null: false, foreign_key: true
      t.string :purpose, null: false
      t.boolean :granted, default: false
      t.datetime :granted_at
      t.datetime :revoked_at

      t.timestamps
    end

    add_index :consents, [:user_id, :purpose], unique: true
  end
end