defmodule Eshop.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :name, :string, size: 200
      add :slug, :string
      add :native_name, :string, null: true, size: 200
      add :desc, :string, null: true, size: 500
      add :is_company, :boolean, default: false, null: true

      timestamps()
    end

    create unique_index(:roles, [:slug])

  end
end
