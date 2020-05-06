defmodule Eshop.Repo.Migrations.CreateSettings do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :key, :string, size: 120
      add :value, :text, size: 500

      timestamps()
    end

  end
end
