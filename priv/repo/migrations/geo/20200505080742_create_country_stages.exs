defmodule Eshop.Repo.Migrations.CreateCountryStages do
  use Ecto.Migration

  def change do
    create table(:country_stages) do
      add :country_id, :integer
      add :stage, :integer
      add :name, :string, null: true, size: 150
      add :native_name, :string, null: true, size: 150
      add :user_id, :integer

      timestamps()
    end

    create index(:country_stages, [:country_id, :stage]) 

  end
end
