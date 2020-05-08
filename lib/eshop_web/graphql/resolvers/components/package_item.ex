defmodule EshopWeb.Schema.Resolvers.PackageItem do

	def list_package_items(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_package_items()}
    end

end
