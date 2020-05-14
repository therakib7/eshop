 defmodule EshopWeb.Schema.Mutations.AuthLogin do
  use Absinthe.Schema.Notation
  
  object :auth_login_mutations do
    # field :login, type: :session do
    #     arg(:email, non_null(:string))
    #     arg(:password, non_null(:string))

    #     resolve &EshopWeb.Schema.Resolvers.AuthLogin.login/2
    # end
  end 
end
