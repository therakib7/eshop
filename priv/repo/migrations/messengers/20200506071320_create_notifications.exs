defmodule Eshop.Repo.Migrations.CreateNotifications do
  use Ecto.Migration

  def change do
    create table(:notifications) do
      add :type, :integer
      add :type_id, :integer
      add :notification_msg_id, :integer
      add :read, :boolean, default: false, null: false

      timestamps()
    end

    create index(:notifications, [:type, :type_id])

  end
end
