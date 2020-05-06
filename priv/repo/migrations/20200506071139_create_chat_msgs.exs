defmodule Eshop.Repo.Migrations.CreateChatMsgs do
  use Ecto.Migration

  def change do
    create table(:chat_msgs) do
      add :msg_type, :integer
      add :msg, :text
      add :read, :boolean, default: false, null: false
      add :deleted_at, :utc_datetime
      add :chat_room_id, references(:chat_rooms, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)
      add :attachment_id, references(:attachments, on_delete: :nothing)

      timestamps()
    end

    create index(:chat_msgs, [:chat_room_id])
    create index(:chat_msgs, [:user_id])
    create index(:chat_msgs, [:attachment_id])
  end
end
