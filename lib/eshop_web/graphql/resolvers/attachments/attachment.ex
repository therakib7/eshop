defmodule EshopWeb.Schema.Resolvers.Attachment do

    def list_ratings(_parent, _args, _resolution) do
        {:ok, Eshop.Activities.list_ratings()}
    end
    
end
