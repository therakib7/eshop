defmodule Eshop.Repo.Migrations.CreateInvoices do
  use Ecto.Migration

  def change do
    create table(:invoices) do
      add :type, :integer
      add :total, :decimal
      add :discount, :decimal
      add :note, :text
      add :paid, :decimal
      add :company_id, references(:companies, on_delete: :nothing)
      add :shop_id, references(:shops, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:invoices, [:company_id])
    create index(:invoices, [:shop_id])
    create index(:invoices, [:user_id])
  end
end
