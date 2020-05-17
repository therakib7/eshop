defmodule EshopWeb.Schema.Mutations.PasswordReset do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.PasswordReset, as: PasswordReset

  object :password_reset_mutations do
    @desc "Create a password_reset"
    field :create_password_reset, type: :password_reset do
      arg(:id, :integer)
      arg(:created_at, :datetime)
      arg(:token, :string)
      arg(:user_id, :id)
      arg(:inserted_at, :naive_datetime)
      arg(:updated_at, :naive_datetime)

      resolve(&PasswordReset.create_password_reset/3)
    end

    @desc "Update a password_reset"
    field :update_password_reset, type: :password_reset do
      arg(:id, non_null(:id))
      arg(:password_reset_params, :password_reset_params)

      resolve(&PasswordReset.update_password_reset/2)
    end

    @desc "Delete a password_reset"
    field :delete_password_reset, type: :password_reset do
      arg(:id, non_null(:id))
      resolve(&PasswordReset.delete_password_reset/2)
    end
  end
end
