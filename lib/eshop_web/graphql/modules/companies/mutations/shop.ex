defmodule EshopWeb.Schema.Mutations.Shop do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Shop, as: Shop

  object :shop_mutations do
    @desc "Create a shop"
    field :create_shop, type: :shop do
      arg(:id, :integer)
      arg(:created_at, :datetime)
      arg(:golden_supplier, :boolean)
      arg(:highest_assurance, :decimal)
      arg(:is_active, :boolean)
      arg(:is_verifed, :boolean)
      arg(:name, :string)
      arg(:native_name, :string)
      arg(:trade_assurance, :boolean)
      arg(:company_id, :id)
      arg(:user_id, :id)
      arg(:location_id, :id)
      arg(:attachment_id, :id)
      arg(:term_condition_id, :id)

      resolve(&Shop.create_shop/3)
    end

    @desc "Update a shop"
    field :update_shop, type: :shop do
      arg(:id, non_null(:id))
      arg(:shop_params, :shop_params)

      resolve(&Shop.update_shop/2)
    end

    @desc "Delete a shop"
    field :delete_shop, type: :shop do
      arg(:id, non_null(:id))
      resolve(&Shop.delete_shop/2)
    end
  end
end
