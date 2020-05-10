defmodule Eshop.Messengers.ChatMsg do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_msgs" do
    field :deleted_at, :utc_datetime
    field :msg, :string
    field :msg_type, :integer
    field :read, :boolean, default: false
    belongs_to :chat_room, Eshop.Messengers.ChatRoom
    belongs_to :user, Eshop.Users.User
    belongs_to :attachment, Eshop.Attachments.Attachment

    timestamps()
  end

  @doc false
  def changeset(chat_msg, attrs) do
    chat_msg
    |> cast(attrs, [:msg_type, :msg, :read, :deleted_at])
    |> validate_required([:msg_type, :msg, :read, :deleted_at])
    |> validate_length(:msg, min: 1, max: 500)
    |> validate_inclusion(:msg_type, 1..2)

  end
end
