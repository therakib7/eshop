defmodule Eshop.Repo.Migrations.CreateUnitTypes do
  use Ecto.Migration

  def change do
    create table(:unit_types) do
      add :name, :string
      add :native_name, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:unit_types, [:user_id])
  end
end
