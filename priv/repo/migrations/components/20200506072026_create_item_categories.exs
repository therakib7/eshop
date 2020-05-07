defmodule Eshop.Repo.Migrations.CreateItemCategories do
  use Ecto.Migration

  def change do
    create table(:item_categories) do
      add :item_id, references(:items, on_delete: :nothing)
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:item_categories, [:item_id])
    create index(:item_categories, [:category_id])
  end
end
