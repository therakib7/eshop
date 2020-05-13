defmodule EshopWeb.Schema.Queries.Company do
  use Absinthe.Schema.Notation 

  object :company_queries do
    @desc "Get all companies"
    field :companies, list_of(:company) do
      resolve &EshopWeb.Schema.Resolvers.Company.list_companies/3
    end
  end 
end

