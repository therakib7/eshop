defmodule EshopWeb.Schema.Resolvers.PrivacyPolicy do

  object "privacy_policy" do
    field :id, :integer
    field :content, :string
    field :native_content, :string
    field :shop_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
