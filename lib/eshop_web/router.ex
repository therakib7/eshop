defmodule EshopWeb.Router do
  use EshopWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/graphql" do
    pipe_through :api

    forward "/ide",
      Absinthe.Plug.GraphiQL,
      schema: EshopWeb.Schema

    forward "/", Absinthe.Plug,
      schema: EshopWeb.Schema
  end

  scope "/api", EshopWeb do
    pipe_through :api

    # Users
    resources "/users", UserController, except: [:new, :edit]
    resources "/users/profiles", UserProfileController, except: [:new, :edit]
    resources "/users/login_details", LoginDetailController, except: [:new, :edit]
    resources "/users/password_resets", PasswordResetController, except: [:new, :edit]
    resources "/users/permissions", PermissionController, except: [:new, :edit]
    resources "/users/user_permissions", UserPermissionController, except: [:new, :edit]
    resources "/users/roles", RoleController, except: [:new, :edit]
    resources "/users/user_roles", UserRoleController, except: [:new, :edit]
    resources "/users/role_permissions", RolePermissionController, except: [:new, :edit]
    resources "/users/update_histories", UpdateHistoryController, except: [:new, :edit]

    # Activities
    resources "/activities/ratings", RatingController, except: [:new, :edit]
    resources "/activities/type_comments", TypeCommentController, except: [:new, :edit]
    resources "/activities/user_loves", UserLoveController, except: [:new, :edit]
    



  end
  

  
  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: EshopWeb.Telemetry
    end
  end
end
