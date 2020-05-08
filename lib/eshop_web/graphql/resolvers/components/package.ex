defmodule EshopWeb.Schema.Resolvers.Package do

	def list_packages(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_packages()}
    end

    def create_package(_parent, args, _resolution) do
        Eshop.Components.create_package(args)
    end

end
