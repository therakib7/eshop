defmodule EshopWeb.Schema.Mutations.LoginDetail do
    use Absinthe.Schema.Notation

    object :login_detail_mutations do
        @desc "Create a login_detail"
        field :create_login_detail, type: :login_detail do 
            arg :id, :integer
            arg :ip_address, :string
            arg :ip_location, :string
            arg :is_active, :boolean
            arg :last_activity, :datetime
            arg :login_at, :datetime
            arg :user_agent, :string
            arg :user_id, :id

            resolve &EshopWeb.Schema.Resolvers.LoginDetail.create_login_detail/2
        end
    end 
end