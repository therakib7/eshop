defmodule EshopWeb.Schema.Mutations.User do
    use Absinthe.Schema.Notation
    
    object :user_mutations do
        @desc "Create a user"
        field :create_user, type: :user do 
            arg :id, :integer
            arg :email, :string
            arg :first_name, :string
            arg :is_active, :boolean
            arg :last_name, :string
            arg :mobile, :string
            arg :password, :string
            arg :password_confirmation, :string
            arg :pin, :integer
            arg :verified_email, :datetime 
            arg :verified_phone, :datetime 
            arg :verified_user, :datetime 

            resolve &EshopWeb.Schema.Resolvers.User.create_user/2
        end
    end 
end