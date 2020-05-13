defmodule EshopWeb.Schema.Types.NotificationMsg do
  use Absinthe.Schema.Notation

  @desc "A notification_msg"
  object :notification_msg do
    field :id, :integer
    field :for, :integer
    field :msg, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A notification_msg update"
  input_object :notification_msg_params do 
    field :for, :integer
    field :msg, :string
  end
end