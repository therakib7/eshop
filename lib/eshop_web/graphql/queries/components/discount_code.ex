defmodule EshopWeb.Schema.Queries.DiscountCode do 
  use Absinthe.Schema.Notation

  object :discount_code_queries do
    @desc "Get all discount_codes"
    field :discount_codes, list_of(:discount_code) do
      resolve &EshopWeb.Schema.Resolvers.DiscountCode.list_discount_codes/3
    end
  end 
end
