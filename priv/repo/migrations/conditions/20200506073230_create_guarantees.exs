defmodule Eshop.Repo.Migrations.CreateGuarantees do
  use Ecto.Migration

  def change do
    create table(:guarantees) do
      add :content, :text, null: true
      add :native_content, :text, null: true
      add :duration, :integer, null: true
      add :gurantee_type, :integer, null: true
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:guarantees, [:item_id])
  end
end
