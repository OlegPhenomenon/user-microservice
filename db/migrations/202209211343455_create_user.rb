Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id, type: :Bignum

      column :name, String, null: false
      column :email, String, null: false
      column :password_digest, String, null: false

      index [:email], name: :index_users_on_email
    end
  end
end