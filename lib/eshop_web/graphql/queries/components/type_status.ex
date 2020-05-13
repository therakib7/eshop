defmodule EshopWeb.Schema.Queries.TypeStatus do 
  use Absinthe.Schema.Notation

  object :type_status_queries do
    @desc "Get all type_statuses"
    field :type_statuses, list_of(:type_status) do
      resolve &EshopWeb.Schema.Resolvers.TypeStatus.list_type_statuses/3
    end
  end 
end
