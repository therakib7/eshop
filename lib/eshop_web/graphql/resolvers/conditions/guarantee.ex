defmodule EshopWeb.Schema.Resolvers.Guarantee do

    def list_guarantees(_parent, _args, _resolution) do
        {:ok, Eshop.Conditions.list_guarantees()}
    end

end
