defmodule EshopWeb.Schema.Resolvers.Guarantee do

    def list_guarantees(_parent, _args, _resolution) do
        {:ok, Eshop.Conditions.list_guarantees()}
    end

    def create_guarantee(_parent, args, _resolution) do
        Eshop.Conditions.create_guarantee(args)
    end

end
