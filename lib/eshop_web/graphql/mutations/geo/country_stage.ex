defmodule EshopWeb.Schema.Mutations.CountryStage do
    use Absinthe.Schema.Notation

    object :country_stage_mutations do
        @desc "Create a country_stage"
        field :create_country_stage, type: :country_stage do 
            arg :id, :integer
            arg :country_id, :integer
            arg :name, :string
            arg :native_name, :string
            arg :stage, :integer
            arg :user_id, :integer

            resolve &EshopWeb.Schema.Resolvers.CountryStage.create_country_stage/3
        end
    end 
end