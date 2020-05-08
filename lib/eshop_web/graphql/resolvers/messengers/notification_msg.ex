defmodule EshopWeb.Schema.Resolvers.NotificationMsg do

	def list_notification_msgs(_parent, _args, _resolution) do
        {:ok, Eshop.Messengers.list_notification_msgs()}
    end

end
