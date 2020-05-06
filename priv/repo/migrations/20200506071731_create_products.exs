defmodule Eshop.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :mfg_date, :naive_datetime
      add :exp_date, :naive_datetime
      add :sku, :string
      add :barcode, :string
      add :brand_id, references(:brands, on_delete: :nothing)

      timestamps()
    end

    create index(:products, [:brand_id])
  end
end
