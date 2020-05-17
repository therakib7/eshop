defmodule EshopWeb.Schema.Types.Brand do
  use Absinthe.Schema.Notation

  @desc "A brand"
  object :brand do
    field :id, :integer
    field :is_active, :boolean
    field :order, :integer
    field :loves, :integer
    field :name, :string
    field :native_name, :string
    field :slug, :string
    field :attachment_id, :id
    field :location_id, :id
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A brand update"
  input_object :brand_params do
    field :is_active, :boolean
    field :order, :integer
    field :loves, :integer
    field :name, :string
    field :native_name, :string
    field :slug, :string
    field :attachment_id, :id
    field :location_id, :id
    field :user_id, :id
  end
end
