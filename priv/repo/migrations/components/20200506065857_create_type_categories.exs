defmodule Eshop.Repo.Migrations.CreateTypeCategories do
  use Ecto.Migration

  def change do
    create table(:type_categories) do
      add :type, :integer
      add :type_id, :integer
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:type_categories, [:category_id])
    create index(:type_categories, [:type, :type_id])
  end
end
