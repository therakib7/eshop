defmodule EshopWeb.Schema.Mutations.NotificationMsg do
  use Absinthe.Schema.Notation
  
  object :notification_msg_mutations do
    @desc "Create a notification_msg"
    field :create_notification_msg, type: :notification_msg do 
      arg :id, :integer
    	arg :for, :integer
    	arg :msg, :string

    	resolve &EshopWeb.Schema.Resolvers.NotificationMsg.create_notification_msg/3
    end
  end 
end
