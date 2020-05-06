defmodule Eshop.Messengers.ChatMsg do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_msgs" do
    field :deleted_at, :utc_datetime
    field :msg, :string
    field :msg_type, :integer
    field :read, :boolean, default: false
    field :chat_room_id, :id
    field :user_id, :id
    field :attachment_id, :id

    timestamps()
  end

  @doc false
  def changeset(chat_msg, attrs) do
    chat_msg
    |> cast(attrs, [:msg_type, :msg, :read, :deleted_at])
    |> validate_required([:msg_type, :msg, :read, :deleted_at])
  end
end
