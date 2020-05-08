defmodule EshopWeb.Schema.Resolvers.Variant do

    def list_variants(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_variants()}
    end

    def create_variant(_parent, args, _resolution) do
        Eshop.Components.create_variant(args)
    end

end
