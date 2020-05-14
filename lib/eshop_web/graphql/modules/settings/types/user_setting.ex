defmodule EshopWeb.Schema.Types.UserSetting do
  use Absinthe.Schema.Notation

  @desc "A user_setting"
  object :user_setting do
    field :id, :integer
    field :key, :string
    field :value, :string
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A user_setting update"
  input_object :user_setting_params do 
    field :key, :string
    field :value, :string
    field :user_id, :id
  end
end