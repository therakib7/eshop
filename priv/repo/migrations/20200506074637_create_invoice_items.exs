defmodule Eshop.Repo.Migrations.CreateInvoiceItems do
  use Ecto.Migration

  def change do
    create table(:invoice_items) do
      add :qty, :integer
      add :price, :decimal
      add :vat, :decimal, null: true
      add :vat_type, :integer, null: true
      add :shipping_charge, :decimal, null: true
      add :status, :integer
      add :item_id, references(:items, on_delete: :nothing)
      add :invoice_id, references(:invoices, on_delete: :nothing)

      timestamps()
    end

    create index(:invoice_items, [:item_id])
    create index(:invoice_items, [:invoice_id])
  end
end
