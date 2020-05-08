defmodule EshopWeb.Schema.Resolvers.RefundPolicy do

	def list_refund_policies(_parent, _args, _resolution) do
        {:ok, Eshop.Conditions.list_refund_policies()}
    end

end
