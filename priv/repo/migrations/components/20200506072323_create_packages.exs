defmodule Eshop.Repo.Migrations.CreatePackages do
  use Ecto.Migration

  def change do
    create table(:packages) do
      add :cost_price, :decimal, null: true
      add :unit_price, :decimal, null: true
      add :sale_price, :decimal, null: true
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:packages, [:item_id])
  end
end
