defmodule Eshop.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :item_id, references(:items, on_delete: :nothing)
      add :mfg_date, :naive_datetime, null: true
      add :exp_date, :naive_datetime, null: true
      add :sku, :string, null: true, size: 100
      add :barcode, :string, null: true, size: 100  
      timestamps()
    end
 
    create index(:products, [:item_id])
  end
end
