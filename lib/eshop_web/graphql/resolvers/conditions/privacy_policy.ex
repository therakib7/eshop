defmodule EshopWeb.Schema.Resolvers.PrivacyPolicy do

	def list_privacy_policies(_parent, _args, _resolution) do
        {:ok, Eshop.Conditions.list_privacy_policies()}
    end

    def create_privacy_policy(_parent, args, _resolution) do
        Eshop.Conditions.create_privacy_policy(args)
    end

end
