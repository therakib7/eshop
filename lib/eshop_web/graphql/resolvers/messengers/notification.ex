defmodule EshopWeb.Schema.Resolvers.Notification do

	def list_notifications(_parent, _args, _resolution) do
        {:ok, Eshop.Messengers.list_notifications()}
    end

end
