defmodule Eshop.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :type, :integer
      add :type_id, :integer
      add :comment, :text, null: true, size: 500
      add :star, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:ratings, [:user_id])
    create index(:ratings, [:type, :type_id])

  end
end
