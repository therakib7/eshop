defmodule EshopWeb.Schema.Queries.TermCondition do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.TermCondition, as: TermCondition

  object :term_condition_queries do
      @desc "Get all term_conditions"
      field :term_conditions, list_of(:term_condition) do
          resolve &TermCondition.list_term_conditions/3
      end

      @desc "Get a term_condition by its id"
      field :term_condition, :term_condition do
          arg :id, non_null(:id)
          resolve &TermCondition.get_term_condition/3
      end 
  end
end
