defmodule EshopWeb.Schema.Types.UserPermission do
    use Absinthe.Schema.Notation
    
    object :user_permission do
    	field :id, :integer
        field :user_id, :id
        field :permission_id, :id
        field :inserted_at, :naive_datetime
        field :updated_at, :naive_datetime
    end
end