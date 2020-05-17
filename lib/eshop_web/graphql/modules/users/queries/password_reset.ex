defmodule EshopWeb.Schema.Queries.PasswordReset do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.PasswordReset, as: PasswordReset

  object :password_reset_queries do
    @desc "Get all password_resets"
    field :password_resets, list_of(:password_reset) do
      resolve(&PasswordReset.list_password_resets/3)
    end

    @desc "Get a password_reset by its id"
    field :password_reset, :password_reset do
      arg(:id, non_null(:id))
      resolve(&PasswordReset.get_password_reset/3)
    end
  end
end
