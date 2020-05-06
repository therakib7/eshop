defmodule Eshop.Repo.Migrations.CreateUserSettings do
  use Ecto.Migration

  def change do
    create table(:user_settings) do
      add :key, :string, size: 120
      add :value, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:user_settings, [:user_id])
  end
end
