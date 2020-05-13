defmodule EshopWeb.Schema.Queries.Guarantee do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Guarantee, as: Guarantee

  object :guarantee_queries do
      @desc "Get all guarantees"
      field :guarantees, list_of(:guarantee) do
          resolve &Guarantee.list_guarantees/3
      end

      @desc "Get a guarantee by its id"
      field :guarantee, :guarantee do
          arg :id, non_null(:id)
          resolve &Guarantee.get_guarantee/3
      end 
  end
end
