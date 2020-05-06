defmodule Eshop.Repo.Migrations.CreateWarehouseVariants do
  use Ecto.Migration

  def change do
    create table(:warehouse_variants) do
      add :type, :integer
      add :name, :string, null: true, size: 100
      add :native_name, :string, null: true, size: 100
      add :company_id, references(:companies, on_delete: :nothing)
      add :parent_id, references(:warehouse_variants, on_delete: :nothing)

      timestamps()
    end

    create index(:warehouse_variants, [:company_id])
    create index(:warehouse_variants, [:parent_id])
    create index(:warehouse_variants, [:type]) 
  end
end
