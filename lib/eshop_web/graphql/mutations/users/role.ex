defmodule EshopWeb.Schema.Mutations.Role do
    use Absinthe.Schema.Notation

    object :role_mutations do
        @desc "Create a role"
        field :create_role, type: :role do 
            arg :id, :integer
            arg :desc, :string
            arg :is_company, :boolean
            arg :name, :string
            arg :slug, :string
            arg :native_name, :string

            resolve &EshopWeb.Schema.Resolvers.Role.create_role/3
        end
    end 
end