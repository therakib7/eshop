defmodule EshopWeb.Schema.Resolvers.Gallery do

	def list_galleries(_parent, _args, _resolution) do
	    {:ok, Eshop.Attachments.list_galleries()}
	end

	def create_gallery(_parent, args, _resolution) do
	    Eshop.Attachments.create_gallery(args)
	end

end
