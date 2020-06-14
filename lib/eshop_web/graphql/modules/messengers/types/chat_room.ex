defmodule EshopWeb.Schema.Types.ChatRoom do
  use Absinthe.Schema.Notation

  @desc "A chat_room"
  object :chat_room do
    field :id, :integer
    field :shop_id, :integer
    field :customer_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A chat_room update"
  input_object :chat_room_params do
    field :shop_id, :integer
    field :customer_id, :integer
  end
end
