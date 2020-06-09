defmodule Eshop.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :is_active, :boolean, default: false, null: false
      add :first_name, :string, size: 100
      add :surname, :string, null: true, size: 50
      add :email, :string, null: true, size: 150
      add :mobile, :string, null: true, size: 30
      add :pin, :integer, null: true
      add :password_hash, :string, size: 255
      add :verified_user, :utc_datetime, null: true
      add :verified_email, :utc_datetime, null: true
      add :verified_phone, :utc_datetime, null: true
      add :token, :string, null: true, size: 10

      timestamps()
    end

  end
end
