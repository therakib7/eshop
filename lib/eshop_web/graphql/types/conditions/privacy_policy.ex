defmodule EshopWeb.Schema.Types.PrivacyPolicy do
  use Absinthe.Schema.Notation
  
  object "privacy_policy" do
    field :id, :integer
    field :content, :string
    field :native_content, :string
    field :shop_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
