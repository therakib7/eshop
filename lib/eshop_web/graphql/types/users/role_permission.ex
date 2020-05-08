defmodule EshopWeb.Schema.Types.RolePermission do
    use Absinthe.Schema.Notation
    
    object :role_permission do
    	field :id, :integer
        field :role_id, :id
        field :permission_id, :id
        field :inserted_at, :naive_datetime
        field :updated_at, :naive_datetime
    end
end