defmodule EshopWeb.Schema.Mutations.Notification do
  use Absinthe.Schema.Notation
  
  object :notification_mutations do
    @desc "Create a notification"
    field :create_notification, type: :notification do 
      arg :id, :integer
    	arg :notification_msg_id, :integer
    	arg :read, :boolean
    	arg :type, :integer
    	arg :type_id, :integer 
      
    	resolve &EshopWeb.Schema.Resolvers.Notification.create_notification/3
    end
  end 
end
