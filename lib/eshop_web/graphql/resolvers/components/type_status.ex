defmodule EshopWeb.Schema.Resolvers.TypeStatus do

    def list_type_statuses(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_type_statuses()}
    end

    def create_type_status(_parent, args, _resolution) do
        Eshop.Components.create_type_status(args)
    end

end
