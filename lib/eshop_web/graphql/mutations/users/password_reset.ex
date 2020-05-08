defmodule EshopWeb.Schema.Mutations.PasswordReset do
    use Absinthe.Schema.Notation
    
    object :password_reset_mutations do
        @desc "Create a password_reset"
        field :create_password_reset, type: :password_reset do 
            arg :id, :integer
            arg :created_at, :datetime
            arg :token, :string
            arg :user_id, :id
            arg :inserted_at, :naive_datetime
            arg :updated_at, :naive_datetime 

            resolve &EshopWeb.Schema.Resolvers.PasswordReset.create_password_reset/2
        end
    end 
end