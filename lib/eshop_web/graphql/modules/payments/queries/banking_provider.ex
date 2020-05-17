defmodule EshopWeb.Schema.Queries.BankingProvider do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.BankingProvider, as: BankingProvider

  object :banking_provider_queries do
    @desc "Get all banking_providers"
    field :banking_providers, list_of(:banking_provider) do
      resolve(&BankingProvider.list_banking_providers/3)
    end

    @desc "Get a banking_provider by its id"
    field :banking_provider, :banking_provider do
      arg(:id, non_null(:id))
      resolve(&BankingProvider.get_banking_provider/3)
    end
  end
end
