defmodule Eshop.Repo.Migrations.CreateGalleries do
  use Ecto.Migration

  def change do
    create table(:galleries) do
      add :type, :integer
      add :type_id, :integer
      add :attachment_id, references(:attachments, on_delete: :nothing)

      timestamps()
    end

    create index(:galleries, [:attachment_id])
    create index(:galleries, [:type, :type_id])
  end
end
