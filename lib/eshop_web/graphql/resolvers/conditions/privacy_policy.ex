defmodule EshopWeb.Schema.Resolvers.PrivacyPolicy do

	def list_privacy_policies(_parent, _args, _resolution) do
        {:ok, Eshop.Conditions.list_privacy_policies()}
    end

end
