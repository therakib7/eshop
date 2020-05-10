defmodule Eshop.Messengers.ChatRoom do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_rooms" do
    field :shop_id, :id
    field :customer_id, :id

    timestamps()
  end

  @doc false
  def changeset(chat_room, attrs) do
    chat_room
    |> cast(attrs, [])
    |> validate_required([])
  end
end
