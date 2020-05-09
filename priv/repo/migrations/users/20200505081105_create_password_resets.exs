defmodule Eshop.Repo.Migrations.CreatePasswordResets do
  use Ecto.Migration

  def change do
    create table(:password_resets) do
      add :token, :string
      add :created_at, :utc_datetime
      add :user_id, references(:users, on_delete: :nothing)

    end

    create index(:password_resets, [:user_id])
  end
end
