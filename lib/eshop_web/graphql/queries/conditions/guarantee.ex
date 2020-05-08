defmodule EshopWeb.Schema.Queries.Guarantee do 
  use Absinthe.Schema.Notation

  object :guarantee_queries do
    @desc "Get all guarantees"
    field :guarantees, list_of(:guarantee) do
      resolve &EshopWeb.Schema.Resolvers.Guarantee.list_guarantees/3
    end
  end 
end
