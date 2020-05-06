defmodule Eshop.Repo.Migrations.CreateItemVariants do
  use Ecto.Migration

  def change do
    create table(:item_variants) do
      add :unit_price, :decimal
      add :cost_price, :decimal
      add :sale_price, :decimal
      add :item_id, references(:items, on_delete: :nothing)
      add :variant_id, references(:variants, on_delete: :nothing)
      add :variant_value_id, references(:variant_values, on_delete: :nothing)

      timestamps()
    end

    create index(:item_variants, [:item_id])
    create index(:item_variants, [:variant_id])
    create index(:item_variants, [:variant_value_id])
  end
end
