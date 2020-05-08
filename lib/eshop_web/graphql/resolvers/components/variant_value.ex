defmodule EshopWeb.Schema.Resolvers.VariantValue do

	def list_variant_values(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_variant_values()}
    end

    def create_variant_value(_parent, args, _resolution) do
        Eshop.Components.create_variant_value(args)
    end

end
