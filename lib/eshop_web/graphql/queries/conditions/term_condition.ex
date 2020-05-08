defmodule EshopWeb.Schema.Queries.TermCondition do 
  use Absinthe.Schema.Notation

  object :term_condition_queries do
    @desc "Get all term_conditions"
    field :term_conditions, list_of(:term_condition) do
      resolve &EshopWeb.Schema.Resolvers.TermCondition.list_term_conditions/3
    end
  end 
end
