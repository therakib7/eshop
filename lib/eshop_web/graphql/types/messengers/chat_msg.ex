defmodule EshopWeb.Schema.Types.ChatMsg do
  use Absinthe.Schema.Notation
  
  object "chat_msg" do
    field :id, :integer
    field :deleted_at, :datetime
    field :msg, :string
    field :msg_type, :integer
    field :read, :boolean
    field :chat_room_id, :id
    field :user_id, :id
    field :attachment_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
