defmodule EshopWeb.Schema.Mutations.DiscountCode do
  use Absinthe.Schema.Notation
  alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Schema.Resolvers.DiscountCode, as: DiscountCode

  object :discount_code_mutations do
    @desc "Create a discount_code"
    field :create_discount_code, type: :discount_code do
      arg(:name, :string)
      arg(:amount, :integer)
      arg(:code, :string)
      arg(:created_at, :datetime)
      arg(:is_active, :boolean)
      arg(:used_at, :datetime)
      arg(:validity, :integer)
      arg(:shop_id, :integer)
      arg(:user_id, :integer)
      arg(:used_by, :id)
      arg(:invoice_id, :integer)

      resolve(&DiscountCode.create_discount_code/3)
    end

    @desc "Update a discount_code"
    field :update_discount_code, type: :discount_code do
      arg(:id, non_null(:id))
      arg(:discount_code_params, :discount_code_params)

      resolve(&DiscountCode.update_discount_code/2)
    end

    @desc "Delete a discount_code"
    field :delete_discount_code, type: :discount_code do
      arg(:id, non_null(:id))
      resolve(&DiscountCode.delete_discount_code/2)
    end
  end
end
