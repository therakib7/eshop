# defmodule EshopWeb.Schema.Types.UpdateHistory do
#     use Absinthe.Schema.Notation
    
#     object :update_history do
#         field :created_at, :utc_datetime
#         field :key, :string
#         field :new_value, :string
#         field :old_value, :string
#         field :type, :integer
#         field :type_id, :integer
#         field :inserted_at, :native_datetime
#         field :updated_at, :native_datetime
#     end
# end