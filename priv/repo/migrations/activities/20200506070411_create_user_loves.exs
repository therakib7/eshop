defmodule Eshop.Repo.Migrations.CreateUserLoves do
  use Ecto.Migration

  def change do
    create table(:user_loves) do
      add :type, :integer
      add :type_id, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:user_loves, [:user_id])
    create index(:user_loves, [:type, :type_id])
    
  end
end
