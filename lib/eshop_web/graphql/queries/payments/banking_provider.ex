defmodule EshopWeb.Schema.Queries.BankingProvider do 
  use Absinthe.Schema.Notation

  object :banking_provider_queries do
    @desc "Get all banking_providers"
    field :banking_providers, list_of(:banking_provider) do
      resolve &EshopWeb.Schema.Resolvers.BankingProvider.list_banking_providers/3
    end
  end 
end
