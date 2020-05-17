defmodule EshopWeb.Schema.Queries.Notification do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Notification, as: Notification

  object :notification_queries do
    @desc "Get all notifications"
    field :notifications, list_of(:notification) do
      resolve(&Notification.list_notifications/3)
    end

    @desc "Get a notification by its id"
    field :notification, :notification do
      arg(:id, non_null(:id))
      resolve(&Notification.get_notification/3)
    end
  end
end
