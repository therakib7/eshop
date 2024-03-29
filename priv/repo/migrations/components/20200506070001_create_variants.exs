defmodule Eshop.Repo.Migrations.CreateVariants do
  use Ecto.Migration

  def change do
    create table(:variants) do
      add :order, :integer, null: true
      add :name, :string, null: true, size: 100
      add :native_name, :string, null: true, size: 100
      add :type, :integer
      add :shop_id, references(:shops, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:variants, [:shop_id])
    create index(:variants, [:user_id])
  end
end
