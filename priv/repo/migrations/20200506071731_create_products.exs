defmodule Eshop.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :mfg_date, :naive_datetime, null: true
      add :exp_date, :naive_datetime, null: true
      add :sku, :string, null: true, size: 100
      add :barcode, :string, null: true, size: 100
      add :brand_id, references(:brands, on_delete: :nothing)

      timestamps()
    end

    create index(:products, [:brand_id])
  end
end
