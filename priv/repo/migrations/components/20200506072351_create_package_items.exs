defmodule Eshop.Repo.Migrations.CreatePackageItems do
  use Ecto.Migration

  def change do
    create table(:package_items) do
      add :name, :string, null: true, size: 150
      add :native_name, :string, null: true, size: 150
      add :package_id, references(:packages, on_delete: :nothing)

      timestamps()
    end

    create index(:package_items, [:package_id])
  end
end
