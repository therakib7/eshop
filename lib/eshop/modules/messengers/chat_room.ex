defmodule Eshop.Messengers.ChatRoom do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_rooms" do
    belongs_to :shop, Eshop.Companies.Shop
    belongs_to :customer, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(chat_room, attrs) do
    chat_room
    |> cast(attrs, [])
    |> validate_required([])
  end
end
