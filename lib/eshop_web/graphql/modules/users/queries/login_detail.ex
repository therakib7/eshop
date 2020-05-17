defmodule EshopWeb.Schema.Queries.LoginDetail do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.LoginDetail, as: LoginDetail

  object :login_detail_queries do
    @desc "Get all login_details"
    field :login_details, list_of(:login_detail) do
      resolve(&LoginDetail.list_login_details/3)
    end

    @desc "Get a login_detail by its id"
    field :login_detail, :login_detail do
      arg(:id, non_null(:id))
      resolve(&LoginDetail.get_login_detail/3)
    end
  end
end
