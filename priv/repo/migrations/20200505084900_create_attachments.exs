defmodule Eshop.Repo.Migrations.CreateAttachments do
  use Ecto.Migration

  def change do
    create table(:attachments) do
      add :type, :integer
      add :type_id, :integer
      add :file_name, :string, size: 150
      add :resized_size, :string 
      add :orginal_size, :string

      timestamps()
    end

    create index(:attachments, [:type, :type_id])

  end
end
