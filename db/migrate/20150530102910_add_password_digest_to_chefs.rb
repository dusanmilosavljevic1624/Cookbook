class AddPasswordDigestToChefs < ActiveRecord::Migration
  add_column :chefs, :password_digest, :string
end
