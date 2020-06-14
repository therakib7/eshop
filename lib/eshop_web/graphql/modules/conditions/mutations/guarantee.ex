defmodule EshopWeb.Schema.Mutations.Guarantee do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Guarantee, as: Guarantee

  object :guarantee_mutations do
    @desc "Create a guarantee"
    field :create_guarantee, type: :guarantee do
      arg(:id, :integer)
      arg(:content, :string)
      arg(:duration, :integer)
      arg(:gurantee_type, :integer)
      arg(:native_content, :string)
      arg(:item_id, :integer)

      resolve(&Guarantee.create_guarantee/3)
    end

    @desc "Update a guarantee"
    field :update_guarantee, type: :guarantee do
      arg(:id, non_null(:id))
      arg(:guarantee_params, :guarantee_params)

      resolve(&Guarantee.update_guarantee/2)
    end

    @desc "Delete a guarantee"
    field :delete_guarantee, type: :guarantee do
      arg(:id, non_null(:id))
      resolve(&Guarantee.delete_guarantee/2)
    end
  end
end
