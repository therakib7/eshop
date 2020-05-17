defmodule EshopWeb.Schema.Mutations.Brand do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Brand, as: Brand

  object :brand_mutations do
    @desc "Create a brand"
    field :create_brand, type: :brand do
      arg(:id, :integer)
      arg(:is_active, :boolean)
      arg(:order, :integer)
      arg(:loves, :integer)
      arg(:name, :string)
      arg(:native_name, :string)
      arg(:slug, :string)
      arg(:attachment_id, :id)
      arg(:location_id, :id)
      arg(:user_id, :id)

      resolve(&Brand.create_brand/3)
    end

    @desc "Update a brand"
    field :update_brand, type: :brand do
      arg(:id, non_null(:id))
      arg(:brand_params, :brand_params)

      resolve(&Brand.update_brand/2)
    end

    @desc "Delete a brand"
    field :delete_brand, type: :brand do
      arg(:id, non_null(:id))
      resolve(&Brand.delete_brand/2)
    end
  end
end
