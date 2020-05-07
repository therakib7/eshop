defmodule EshopWeb.Schema.Mutations.User do
    use Absinthe.Schema.Notation

    object :user_mutations do
        @desc "Create a user"
        field :create_user, type: :user do 
            arg :id, :integer
            arg :email, non_null(:string)
            arg :first_name, :string
            arg :is_active, :boolean
            arg :last_name, :string
            arg :mobile, :string
            arg :password_hash, :string
            arg :pin, :integer
            arg :verified_email, :string
            arg :verified_phone, :string
            arg :verified_user, :string

            resolve &EshopWeb.Schema.Resolvers.User.create_user/3
        end
    end 
end