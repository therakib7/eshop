defmodule Eshop.Repo.Migrations.CreateNotificationMsgs do
  use Ecto.Migration

  def change do
    create table(:notification_msgs) do
      add :msg, :text
      add :for, :integer

      timestamps()
    end

  end
end
