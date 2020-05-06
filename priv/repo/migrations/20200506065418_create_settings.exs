defmodule Eshop.Repo.Migrations.CreateSettings do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :key, :string, size: 120
      add :value, :text

      timestamps()
    end

  end
end
