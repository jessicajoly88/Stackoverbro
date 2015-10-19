class CreateTables < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :body, :text
      t.column :user_id, :integer
      t.column :vote, :integer

      t.timestamps
    end

    create_table :answers do |t|
      t.column :question_id, :integer
      t.column :content, :text
      t.column :user_id, :integer
      t.column :vote, :integer

      t.timestamps
    end

    create_table :users do |t|
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string

      t.timestamps
    end

  end
end
