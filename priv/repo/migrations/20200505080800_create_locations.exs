defmodule Eshop.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :is_active, :boolean, default: false, null: false
      add :country_id, :integer
      add :stage_id, :integer
      add :parent_id, :integer
      add :name, :string
      add :native_name, :string
      add :order, :integer
      add :code, :string
      add :lat, :float
      add :long, :float
      add :web, :string
      add :user_id, :integer

      timestamps()
    end

    create index(:locations, [:parent_id]) 
    create index(:locations, [:country_id, :stage_id]) 

  end
end
