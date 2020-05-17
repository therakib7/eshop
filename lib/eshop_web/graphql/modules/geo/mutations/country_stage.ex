defmodule EshopWeb.Schema.Mutations.CountryStage do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.CountryStage, as: CountryStage

  object :country_stage_mutations do
    @desc "Create a country_stage"
    field :create_country_stage, type: :country_stage do
      arg(:id, :integer)
      arg(:country_id, :integer)
      arg(:name, :string)
      arg(:native_name, :string)
      arg(:stage, :integer)
      arg(:user_id, :integer)

      resolve(&CountryStage.create_country_stage/3)
    end

    @desc "Update a country_stage"
    field :update_country_stage, type: :country_stage do
      arg(:id, non_null(:id))
      arg(:country_stage_params, :country_stage_params)

      resolve(&CountryStage.update_country_stage/2)
    end

    @desc "Delete a country_stage"
    field :delete_country_stage, type: :country_stage do
      arg(:id, non_null(:id))
      resolve(&CountryStage.delete_country_stage/2)
    end
  end
end
