defmodule EshopWeb.Schema.Types.Location do
  use Absinthe.Schema.Notation

  @desc "A location"
  object :location do
    field :id, :integer
    field :code, :string
		field :country_id, :integer
		field :is_active, :boolean
		field :lat, :float
		field :long, :float
		field :name, :string
		field :native_name, :string
		field :order, :integer
		field :parent_id, :integer
		field :stage_id, :integer
		field :user_id, :integer
		field :web, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A location update"
  input_object :location_params do 
    field :code, :string
		field :country_id, :integer
		field :is_active, :boolean
		field :lat, :float
		field :long, :float
		field :name, :string
		field :native_name, :string
		field :order, :integer
		field :parent_id, :integer
		field :stage_id, :integer
		field :user_id, :integer
		field :web, :string
  end
end