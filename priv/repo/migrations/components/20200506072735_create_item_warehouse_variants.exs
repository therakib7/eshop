defmodule Eshop.Repo.Migrations.CreateItemWarehouseVariants do
  use Ecto.Migration

  def change do
    create table(:item_warehouse_variants) do
      add :item_id, references(:items, on_delete: :nothing)
      add :warehouse_variant_id, references(:warehouse_variants, on_delete: :nothing)
      add :warehouse_variant_value_id, references(:warehouse_variant_values, on_delete: :nothing)

      timestamps()
    end

    create index(:item_warehouse_variants, [:item_id])
    create index(:item_warehouse_variants, [:warehouse_variant_id])
    create index(:item_warehouse_variants, [:warehouse_variant_value_id])
  end
end
