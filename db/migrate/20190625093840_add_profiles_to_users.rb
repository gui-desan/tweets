# frozen_string_literal: true

class AddProfilesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :gender, :smallint, default: 0
  end
end
