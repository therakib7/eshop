defmodule EshopWeb.Schema.Types.AuthLogin do
    use Absinthe.Schema.Notation
  
    @desc "A auth_login"
    object :auth_login do  
      field :token, :string 
    end 
end