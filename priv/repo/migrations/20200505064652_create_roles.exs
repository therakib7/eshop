defmodule Eshop.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :name, :string
      add :slug, :string
      add :native_name, :string
      add :desc, :string
      add :is_company, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:roles, [:slug])

  end
end
