defmodule EshopWeb.Schema.Resolvers.BankingProvider do

    def list_banking_providers(_parent, _args, _resolution) do
        {:ok, Eshop.Payments.list_banking_providers()}
    end

    def create_banking_provider(_parent, args, _resolution) do
        Eshop.Payments.create_banking_provider(args)
    end

end
