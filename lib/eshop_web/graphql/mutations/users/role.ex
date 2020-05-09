defmodule EshopWeb.Schema.Mutations.Role do
    use Absinthe.Schema.Notation

    object :role_mutations do
        @desc "Create a role"
        field :create_role, type: :role do 
            arg :desc, :string
            arg :is_company, :boolean
            arg :name, :string
            arg :slug, :string
            arg :native_name, :string

            resolve &EshopWeb.Schema.Resolvers.Role.create_role/3
        end

        @desc "Update a role"
        field :update_role, type: :role do
            arg(:id, non_null(:id))
            arg(:role_params, :role_params)
    
            resolve &EshopWeb.Schema.Resolvers.Role.update_role/2
        end
        
        @desc "Delete a role"
        field :delete_role, type: :role do
            arg(:id, non_null(:id))
            resolve &EshopWeb.Schema.Resolvers.Role.delete_role/2
        end
    end 
end