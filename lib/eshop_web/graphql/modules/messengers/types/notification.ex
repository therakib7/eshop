defmodule EshopWeb.Schema.Types.Notification do
  use Absinthe.Schema.Notation

  @desc "A notification"
  object :notification do
    field :id, :integer
    field :notification_msg_id, :integer
    field :read, :boolean
    field :type, :integer
    field :type_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A notification update"
  input_object :notification_params do
    field :notification_msg_id, :integer
    field :read, :boolean
    field :type, :integer
    field :type_id, :integer
  end
end
