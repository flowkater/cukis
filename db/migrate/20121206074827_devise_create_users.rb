class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => "" # 이메일
      t.string :encrypted_password, :null => false, :default => "" # 패스워드

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Information
      t.string :nickname, null: false, default: "" # 이름
      t.string :phone # 전화번호
      t.string :phone_first
      t.string :phone_second
      t.string :phone_third
      t.string :gender # 성별
      t.date :birthday # 생일
      t.boolean :use_policy
      t.boolean :personal_policy
      t.boolean :student
      t.boolean :parent

      t.string :gcm_regid

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      t.string :authentication_token

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    add_index :users, :authentication_token, unique: true
    add_index :users, :nickname, unique: true
  end
end
