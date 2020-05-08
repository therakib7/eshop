defmodule EshopWeb.Schema.Resolvers.PackageItem do

	def list_package_items(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_package_items()}
    end

    def create_package_item(_parent, args, _resolution) do
        Eshop.Components.create_package_item(args)
    end

end
