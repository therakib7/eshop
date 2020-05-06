defmodule Eshop.Repo.Migrations.CreateUnitTypes do
  use Ecto.Migration

  def change do
    create table(:unit_types) do
      add :name, :string, null: true, size: 50
      add :native_name, :string, null: true, size: 50
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:unit_types, [:user_id])
  end
end
