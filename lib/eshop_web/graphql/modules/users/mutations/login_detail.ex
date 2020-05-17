defmodule EshopWeb.Schema.Mutations.LoginDetail do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.LoginDetail, as: LoginDetail

  object :login_detail_mutations do
    @desc "Create a login_detail"
    field :create_login_detail, type: :login_detail do
      arg(:id, :integer)
      arg(:ip_address, :string)
      arg(:ip_location, :string)
      arg(:is_active, :boolean)
      arg(:last_activity, :datetime)
      arg(:login_at, :datetime)
      arg(:user_agent, :string)
      arg(:user_id, :id)

      resolve(&LoginDetail.create_login_detail/3)
    end

    @desc "Update a login_detail"
    field :update_login_detail, type: :login_detail do
      arg(:id, non_null(:id))
      arg(:login_detail_params, :login_detail_params)

      resolve(&LoginDetail.update_login_detail/2)
    end

    @desc "Delete a login_detail"
    field :delete_login_detail, type: :login_detail do
      arg(:id, non_null(:id))
      resolve(&LoginDetail.delete_login_detail/2)
    end
  end
end
