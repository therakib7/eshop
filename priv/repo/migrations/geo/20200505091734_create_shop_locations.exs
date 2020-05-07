defmodule Eshop.Repo.Migrations.CreateShopLocations do
  use Ecto.Migration

  def change do
    create table(:shop_locations) do
      add :shop_id, references(:shops, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:shop_locations, [:shop_id])
    create index(:shop_locations, [:location_id])
  end
end
