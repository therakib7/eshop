defmodule Eshop.Repo.Migrations.CreateUpdateHistories do
  use Ecto.Migration

  def change do
    create table(:update_histories) do
      add :type, :integer
      add :type_id, :integer
      add :key, :string
      add :old_value, :string
      add :new_value, :string
      add :created_at, :utc_datetime

      timestamps()
    end

    create index(:update_histories, [:type, :type_id]) 

  end
end
