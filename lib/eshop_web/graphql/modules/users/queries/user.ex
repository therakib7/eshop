defmodule EshopWeb.Schema.Queries.User do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.User, as: User

  input_object :user_filter do
    field :id, :integer
    field :first_name, :string
    field :mobile, :string
    field :email, :string
    field :inserted_before, :naive_datetime
    field :inserted_after, :naive_datetime
  end
  
  object :user_queries do
    @desc "Get all users"
    field :users, list_of(:user) do
      # user_view
      middleware(EshopWeb.Graphql.Middleware.Authorize, 2)
      arg :filter, :user_filter  
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
