defmodule EshopWeb.Schema.Types.ChatRoom do
  use Absinthe.Schema.Notation
  
  object "chat_room" do
    field :id, :integer
    field :shop_id, :id
    field :customer_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
