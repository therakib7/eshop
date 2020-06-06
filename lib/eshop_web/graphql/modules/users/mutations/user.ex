defmodule EshopWeb.Schema.Mutations.User do
  use Absinthe.Schema.Notation

  alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Graphql.Middleware.UserPer
  alias EshopWeb.Schema.Resolvers.User

  object :user_mutations do
    @desc "Create a user"
    field :create_user, type: :user do
      arg(:id, :integer)
      arg(:email, :string)
      arg(:first_name, :string)
      arg(:is_active, :boolean)
      arg(:surname, :string)
      arg(:mobile, :string)
      arg(:password, :string)
      arg(:password_confirmation, :string)
      arg(:pin, :integer)

      resolve(&User.create_user/3)
    end

    @desc "Update a user"

    field :update_user, type: :user do 
      middleware(Auth) 
      middleware(UserPer, %{p: 50, m: "user"}) 
      arg(:id, non_null(:id))
      arg(:user_params, :user_params)
      resolve(&User.update_user/2)
    end

    @desc "Delete a user"
    field :delete_user, type: :user do
      arg(:id, non_null(:id))
      resolve(&User.delete_user/2)
    end
  end
end
