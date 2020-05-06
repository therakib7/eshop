defmodule Eshop.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :is_active, :boolean, default: false, null: false
      add :order, :integer, null: true
      add :name, :string
      add :native_name, :string
      add :slug, :string
      add :parent_id, references(:categories, on_delete: :nothing)
      add :attachment_id, references(:attachments, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:categories, [:parent_id])
    create index(:categories, [:attachment_id])
    create index(:categories, [:user_id])
  end
end
