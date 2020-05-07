defmodule Eshop.Repo.Migrations.CreateTypeUserRoles do
  use Ecto.Migration

  def change do
    create table(:type_user_roles) do
      add :type, :integer
      add :type_id, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :role_id, references(:roles, on_delete: :nothing)

      timestamps()
    end

    create index(:type_user_roles, [:user_id])
    create index(:type_user_roles, [:role_id])
    create index(:type_user_roles, [:type, :type_id])
  end
end
