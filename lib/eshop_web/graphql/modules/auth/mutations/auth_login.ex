defmodule EshopWeb.Schema.Mutations.AuthLogin do
  use Absinthe.Schema.Notation

  object :auth_login_mutations do
    @desc "login"
    field :login, type: :auth_login do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&EshopWeb.Schema.Resolvers.AuthLogin.login/2)
    end

    @desc "logout"
    field :logout, type: :auth_login do
      arg(:token, non_null(:string))
      middleware(EshopWeb.Graphql.Middleware.Authorize, :any)
      resolve(&EshopWeb.Schema.Resolvers.AuthLogin.logout/2)
    end
  end
end
