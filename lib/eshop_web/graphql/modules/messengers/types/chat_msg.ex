defmodule EshopWeb.Schema.Types.ChatMsg do
  use Absinthe.Schema.Notation

  @desc "A chat_msg"
  object :chat_msg do
    field :id, :integer
    field :deleted_at, :datetime
    field :msg, :string
    field :msg_type, :integer
    field :read, :boolean
    field :chat_room_id, :integer
    field :user_id, :integer
    field :attachment_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A chat_msg update"
  input_object :chat_msg_params do
    field :deleted_at, :datetime
    field :msg, :string
    field :msg_type, :integer
    field :read, :boolean
    field :chat_room_id, :integer
    field :user_id, :integer
    field :attachment_id, :integer
  end
end
