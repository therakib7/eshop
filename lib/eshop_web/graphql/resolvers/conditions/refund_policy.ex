defmodule EshopWeb.Schema.Resolvers.RefundPolicy do

	def list_refund_policies(_parent, _args, _resolution) do
        {:ok, Eshop.Conditions.list_refund_policies()}
    end

    def create_refund_policy(_parent, args, _resolution) do
        Eshop.Conditions.create_refund_policy(args)
    end

end
