defmodule EshopWeb.Schema.Queries.NotificationMsg do 
  use Absinthe.Schema.Notation

  object :notification_msg_queries do
    @desc "Get all notification_msgs"
    field :notification_msgs, list_of(:notification_msg) do
      resolve &EshopWeb.Schema.Resolvers.NotificationMsg.list_notification_msgs/3
    end
  end 
end
