defmodule EshopWeb.Schema.Resolvers.TermCondition do

	def list_term_conditions(_parent, _args, _resolution) do
        {:ok, Eshop.Conditions.list_term_conditions()}
    end

end
