defmodule Eshop.Repo.Migrations.CreateTermConditions do
  use Ecto.Migration

  def change do
    create table(:term_conditions) do
      add :type, :integer
      add :type_id, :integer
      add :content, :text, size: 3000
      add :native_content, :text, null: true, size: 3000

      timestamps()
    end

    create index(:term_conditions, [:type, :type_id])

  end
end
