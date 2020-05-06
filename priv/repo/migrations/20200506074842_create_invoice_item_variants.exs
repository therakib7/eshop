defmodule Eshop.Repo.Migrations.CreateInvoiceItemVariants do
  use Ecto.Migration

  def change do
    create table(:invoice_item_variants) do
      add :invoice_item_id, references(:invoice_items, on_delete: :nothing)
      add :variant_id, references(:variants, on_delete: :nothing)
      add :variant_value_id, references(:variant_values, on_delete: :nothing)

      timestamps()
    end

    create index(:invoice_item_variants, [:invoice_item_id])
    create index(:invoice_item_variants, [:variant_id])
    create index(:invoice_item_variants, [:variant_value_id])
  end
end
