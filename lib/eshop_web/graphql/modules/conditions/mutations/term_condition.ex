defmodule EshopWeb.Schema.Mutations.TermCondition do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.TermCondition, as: TermCondition

  object :term_condition_mutations do
    @desc "Create a term_condition"
    field :create_term_condition, type: :term_condition do
      arg(:id, :integer)
      arg(:content, :string)
      arg(:native_content, :string)
      arg(:type, :integer)
      arg(:type_id, :integer)

      resolve(&TermCondition.create_term_condition/3)
    end

    @desc "Update a term_condition"
    field :update_term_condition, type: :term_condition do
      arg(:id, non_null(:id))
      arg(:term_condition_params, :term_condition_params)

      resolve(&TermCondition.update_term_condition/2)
    end

    @desc "Delete a term_condition"
    field :delete_term_condition, type: :term_condition do
      arg(:id, non_null(:id))
      resolve(&TermCondition.delete_term_condition/2)
    end
  end
end
