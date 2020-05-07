defmodule Eshop.Repo.Migrations.CreateTermConditions do
  use Ecto.Migration

  def change do
    create table(:term_conditions) do
      add :type, :integer
      add :type_id, :integer
      add :content, :text, null: true
      add :native_content, :text, null: true

      timestamps()
    end

    create index(:term_conditions, [:type, :type_id])

  end
end
