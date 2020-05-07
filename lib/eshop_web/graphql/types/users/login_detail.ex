# defmodule EshopWeb.Schema.Types.LoginDetail do
#     use Absinthe.Schema.Notation

#     object :login_detail do
#         field :ip_address, :string
#         field :ip_location, :string
#         field :is_active, :boolean
#         field :last_activity, :utc_datetime
#         field :login_at, :utc_datetime
#         field :user_agent, :string
#         field :user_id, :id
#         field :inserted_at, :native_datetime
#         field :updated_at, :native_datetime
#     end
# end