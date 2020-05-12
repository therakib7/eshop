defmodule Eshop.Repo.Migrations.CreateTypeStatuses do
  use Ecto.Migration

  def change do
    create table(:type_statuses) do
      add :is_active, :boolean, default: false, null: false
      add :order, :integer
      add :type, :integer
      add :name, :string
      add :native_name, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:type_statuses, [:user_id])
  end
end
