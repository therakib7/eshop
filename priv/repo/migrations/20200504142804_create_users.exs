defmodule Eshop.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :is_active, :boolean, default: false, null: false
      add :first_name, :string, size: 100
      add :last_name, :string, null: true, size: 50
      add :email, :string, null: true, size: 150
      add :mobile, :string, null: true, size: 30
      add :pin, :integer, null: true
      add :password_hash, :string, size: 255
      add :verified_user, :naive_datetime, null: true
      add :verified_email, :naive_datetime, null: true
      add :verified_phone, :naive_datetime, null: true

      timestamps()
    end

  end
end
