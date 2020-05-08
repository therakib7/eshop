defmodule EshopWeb.Schema.Mutations.Permission do
    use Absinthe.Schema.Notation
    
    object :permission_mutations do
        @desc "Create a permission"
        field :create_permission, type: :permission do 
    		arg :id, :integer
            arg :name, :string
            arg :slug, :string
            arg :inserted_at, :naive_datetime
            arg :updated_at, :naive_datetime 

            resolve &EshopWeb.Schema.Resolvers.Permission.create_user/3
        end
    end 
end