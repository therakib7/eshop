defmodule EshopWeb.Schema.Queries.User do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.User, as: User

  object :user_queries do
    @desc "Get all users"
    field :users, list_of(:user) do
      middleware(EshopWeb.Graphql.Middleware.Authorize)
      resolve(&User.list_users/3)
    end

    @desc "Get a user by its id"
    field :user, :user do
      middleware(EshopWeb.Graphql.Middleware.Authorize)
      arg(:id, non_null(:id))
      resolve(&User.get_user/3)
    end
  end
end
