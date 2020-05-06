defmodule Eshop.Repo.Migrations.CreateBrands do
  use Ecto.Migration

  def change do
    create table(:brands) do
      add :is_active, :boolean, default: false, null: false
      add :order, :integer, null: true
      add :name, :string
      add :native_name, :string
      add :slug, :string
      add :loves, :integer
      add :attachment_id, references(:attachments, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:brands, [:attachment_id])
    create index(:brands, [:location_id])
    create index(:brands, [:user_id])
  end
end
