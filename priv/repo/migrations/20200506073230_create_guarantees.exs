defmodule Eshop.Repo.Migrations.CreateGuarantees do
  use Ecto.Migration

  def change do
    create table(:guarantees) do
      add :content, :text
      add :native_content, :text
      add :duration, :integer
      add :gurantee_type, :integer
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:guarantees, [:item_id])
  end
end
