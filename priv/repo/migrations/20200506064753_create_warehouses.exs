defmodule Eshop.Repo.Migrations.CreateWarehouses do
  use Ecto.Migration

  def change do
    create table(:warehouses) do
      add :is_active, :boolean, default: false, null: false
      add :name, :string
      add :native_name, :string
      add :shop_id, references(:shops, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:warehouses, [:shop_id])
    create index(:warehouses, [:user_id])
    create index(:warehouses, [:location_id])
  end
end
