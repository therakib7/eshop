defmodule Eshop.Repo.Migrations.CreateTypeComments do
  use Ecto.Migration

  def change do
    create table(:type_comments) do
      add :type, :integer
      add :type_id, :integer
      add :comment, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:type_comments, [:user_id])
    create index(:type_comments, [:type, :type_id])

  end
end
