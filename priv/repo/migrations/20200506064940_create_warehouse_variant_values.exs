defmodule Eshop.Repo.Migrations.CreateWarehouseVariantValues do
  use Ecto.Migration

  def change do
    create table(:warehouse_variant_values) do
      add :value, :string
      add :native_value, :string
      add :warehouse_variant_id, references(:warehouse_variants, on_delete: :nothing)

      timestamps()
    end

    create index(:warehouse_variant_values, [:warehouse_variant_id])
  end
end
