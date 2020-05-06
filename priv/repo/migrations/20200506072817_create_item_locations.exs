defmodule Eshop.Repo.Migrations.CreateItemLocations do
  use Ecto.Migration

  def change do
    create table(:item_locations) do
      add :item_id, references(:items, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:item_locations, [:item_id])
    create index(:item_locations, [:location_id])
  end
end
