defmodule Eshop.Repo.Migrations.CreateNotificationMsgs do
  use Ecto.Migration

  def change do
    create table(:notification_msgs) do
      add :msg, :text, null: true, size: 255
      add :for, :integer

      timestamps()
    end

  end
end
