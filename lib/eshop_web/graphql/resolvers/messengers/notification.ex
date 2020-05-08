defmodule EshopWeb.Schema.Resolvers.Notification do

  object "notification" do
    field :id, :integer
    field :notification_msg_id, :integer
    field :read, :boolean
    field :type, :integer
    field :type_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
