defmodule EshopWeb.Schema.Queries.UserSetting do 
  use Absinthe.Schema.Notation

  object :user_setting_queries do
    field :id, :integer
    field :key, :string
    field :value, :string
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
