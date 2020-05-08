defmodule EshopWeb.Schema.Types.UserSetting do
  use Absinthe.Schema.Notation
  
  object "user_setting" do
    field :id, :integer
    field :key, :string
    field :value, :string
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
