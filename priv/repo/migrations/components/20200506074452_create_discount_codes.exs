defmodule Eshop.Repo.Migrations.CreateDiscountCodes do
  use Ecto.Migration

  def change do
    create table(:discount_codes) do
      add :is_active, :boolean, default: false, null: false
      add :code, :string, size: 50
      add :amount, :integer
      add :validity, :integer, null: true
      add :created_at, :utc_datetime
      add :used_at, :utc_datetime
      add :shop_id, references(:shops, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)
      add :used_by, references(:users, on_delete: :nothing)
      add :invoice_id, references(:invoices, on_delete: :nothing)

      timestamps()
    end

    create index(:discount_codes, [:shop_id])
    create index(:discount_codes, [:user_id])
    create index(:discount_codes, [:used_by])
    create index(:discount_codes, [:invoice_id])
  end
end
