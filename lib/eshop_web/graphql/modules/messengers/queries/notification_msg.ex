defmodule EshopWeb.Schema.Queries.NotificationMsg do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.NotificationMsg, as: NotificationMsg

  object :notification_msg_queries do
    @desc "Get all notification_msgs"
    field :notification_msgs, list_of(:notification_msg) do
      resolve(&NotificationMsg.list_notification_msgs/3)
    end

    @desc "Get a notification_msg by its id"
    field :notification_msg, :notification_msg do
      arg(:id, non_null(:id))
      resolve(&NotificationMsg.get_notification_msg/3)
    end
  end
end
