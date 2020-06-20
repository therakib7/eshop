defmodule Eshop.Repo.Migrations.CreatePackages do
  use Ecto.Migration

  def change do
    create table(:packages) do
      add :item_id, references(:items, on_delete: :nothing)
      add :cost_price, :decimal, null: true
      add :unit_price, :decimal, null: true
      add :sale_price, :decimal, null: true
      add :title, :string, null: true, size: 255
      add :native_title, :string, null: true, size: 255
      add :subtitle, :string, null: true, size: 255 
      add :native_subtitle, :string, null: true, size: 255  
      add :content, {:array, :jsonb}
      add :native_content, {:array, :jsonb}
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:packages, [:item_id])
  end
end
