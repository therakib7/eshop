defmodule Eshop.Repo.Migrations.CreateInvoiceStatuses do
  use Ecto.Migration

  def change do
    create table(:invoice_statuses) do
      add :type, :integer
      add :type_id, :integer
      add :invoice_id, references(:invoices, on_delete: :nothing)
      add :type_status_id, references(:type_statuses, on_delete: :nothing)

      timestamps()
    end

    create index(:invoice_statuses, [:invoice_id])
    create index(:invoice_statuses, [:type_status_id])
  end
end
