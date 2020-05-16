defmodule Eshop.Guardian do
  use Guardian, otp_app: :eshop
  alias Eshop.Users.User

  @behaviour Guardian.Serializer
 
  def subject_for_token(user, _claims) do
   sub = to_string(user.id)
   {:ok, sub}
  end
 
  # def resource_from_claims(%{"sub" => id}) do
  #   user = User.get_user!(id)
  #   {:ok, user}
  # rescue
  #   Ecto.NoResultsError -> {:error, :resource_not_found}
  # end

  def resource_from_claims(claims) do
    # Here we'll look up our resource from the claims, the subject can be
    # found in the `"sub"` key. In `above subject_for_token/2` we returned
    # the resource id so here we'll rely on that to look it up.
    id = claims["sub"]
    resource = User.get_user!(id)
    {:ok,  resource}
  end

  def after_encode_and_sign(resource, claims, token) do
    with {:ok, _} <- Guardian.DB.after_encode_and_sign(resource, claims["typ"], claims, token) do
      {:ok, token}
    end
  end

  def on_verify(claims, token) do
    with {:ok, _} <- Guardian.DB.on_verify(claims, token) do
      {:ok, claims}
    end
  end

  def on_revoke(claims, token) do
    with {:ok, _} <- Guardian.DB.on_revoke(claims, token) do
      {:ok, claims}
    end
  end
 end