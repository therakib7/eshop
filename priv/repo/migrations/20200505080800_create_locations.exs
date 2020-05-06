defmodule Eshop.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :is_active, :boolean, default: false, null: false
      add :country_id, :integer
      add :stage_id, :integer
      add :parent_id, :integer, null: true
      add :name, :string, null: true, size: 150
      add :native_name, :string, null: true, size: 150
      add :order, :integer, null: true
      add :code, :string, null: true, size: 10
      add :lat, :float, null: true
      add :long, :float, null: true
      add :web, :string, null: true, size: 255
      add :user_id, :integer

      timestamps()
    end

    create index(:locations, [:parent_id]) 
    create index(:locations, [:country_id, :stage_id]) 

  end
end
