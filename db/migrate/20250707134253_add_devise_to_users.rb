# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      ## ZATEN VAR — yorum satırı yapıldı:
       #t.string :email,              null: false, default: ""
       t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable (isteğe bağlı)
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable (opsiyonel)
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email

      ## Lockable (opsiyonel)
      # t.integer  :failed_attempts, default: 0, null: false
      # t.string   :unlock_token
      # t.datetime :locked_at
    end

    ## ZATEN VAR OLABİLİR — yorum yap:
    # add_index :users, :email, unique: true

    add_index :users, :reset_password_token, unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
