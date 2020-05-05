defmodule Eshop.Repo.Migrations.CreateAttachments do
  use Ecto.Migration

  def change do
    create table(:attachments) do
      add :type, :integer
      add :type_id, :integer
      add :file_name, :string
      add :resized_size, :string
      add :orginal_size, :string

      timestamps()
    end

  end
end
