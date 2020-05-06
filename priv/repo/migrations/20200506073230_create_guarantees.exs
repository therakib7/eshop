defmodule Eshop.Repo.Migrations.CreateGuarantees do
  use Ecto.Migration

  def change do
    create table(:guarantees) do
      add :content, :text, null: true, size: 500
      add :native_content, :text, null: true, size: 500
      add :duration, :integer, null: true
      add :gurantee_type, :, null: true
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:guarantees, [:item_id])
  end
end
