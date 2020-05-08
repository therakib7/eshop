defmodule EshopWeb.Schema.Queries.Notification do 
  use Absinthe.Schema.Notation

  object :notification_queries do
    @desc "Get all notifications"
    field :notifications, list_of(:notification) do
      resolve &EshopWeb.Schema.Resolvers.Notification.list_notifications/3
    end
  end 
end
