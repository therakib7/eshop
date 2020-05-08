defmodule EshopWeb.Schema.Resolvers.TermCondition do

	def list_term_conditions(_parent, _args, _resolution) do
        {:ok, Eshop.Conditions.list_term_conditions()}
    end

    def create_term_condition(_parent, args, _resolution) do
        Eshop.Conditions.create_term_condition(args)
    end

end
