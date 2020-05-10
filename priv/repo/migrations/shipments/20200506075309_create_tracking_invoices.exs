defmodule Eshop.Repo.Migrations.CreateTrackingInvoices do
  use Ecto.Migration

  def change do
    create table(:tracking_invoices) do
      add :tracking_id, :string, null: true, size: 200
      add :invoice_id, references(:invoices, on_delete: :nothing)
      add :shipping_method_id, references(:shipping_methods, on_delete: :nothing)

      timestamps()
    end

    create index(:tracking_invoices, [:invoice_id])
    create index(:tracking_invoices, [:shipping_method_id])
  end
end
