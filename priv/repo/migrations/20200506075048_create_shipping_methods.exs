defmodule Eshop.Repo.Migrations.CreateShippingMethods do
  use Ecto.Migration

  def change do
    create table(:shipping_methods) do
      add :is_active, :boolean, default: false, null: false
      add :name, :string
      add :native_name, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:shipping_methods, [:user_id])
    create index(:shipping_methods, [:location_id])
  end
end
