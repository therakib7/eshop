defmodule EshopWeb.Schema.Types.CountryStage do
  use Absinthe.Schema.Notation

  @desc "A country_stage"
  object :country_stage do
    field :id, :integer
    field :country_id, :integer
    field :name, :string
    field :native_name, :string
    field :stage, :integer
    field :user_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A country_stage update"
  input_object :country_stage_params do
    field :country_id, :integer
    field :name, :string
    field :native_name, :string
    field :stage, :integer
    field :user_id, :integer
  end
end
