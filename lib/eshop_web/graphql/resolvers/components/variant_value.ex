defmodule EshopWeb.Schema.Resolvers.VariantValue do

	def list_variant_values(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_variant_values()}
    end

end
