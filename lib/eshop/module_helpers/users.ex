defmodule Eshop.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Eshop.Repo

  alias Eshop.Users.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  def relay_list_users(args) do  
    query = from p in User 
    filter_with(query, args.filter)  
  end

  def list_users(args) do
    Enum.reduce(args, User, fn
      {:order, order}, query ->
        query |> order_by({^order, :first_name})

      {:filter, filter}, query ->
        query |> filter_with(filter)
    end)
    |> Repo.all()
  end

  defp filter_with(query, filter) do
    Enum.reduce(filter, query, fn
      {:id, id}, query ->
        from q in query, where: q.id == ^id

      {:first_name, first_name}, query ->
        from q in query, where: ilike(q.first_name, ^"%#{first_name}%")

      {:mobile, mobile}, query ->
        from q in query, where: ilike(q.mobile, ^"%#{mobile}%")

      {:email, email}, query ->
        from q in query, where: ilike(q.email, ^"%#{email}%")

      {:inserted_before, date}, query ->
        from q in query, where: q.inserted_at <= ^date

      {:inserted_after, date}, query ->
        from q in query, where: q.inserted_at >= ^date
    end)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias Eshop.Users.UserProfile

  @doc """
  Returns the list of user_profiles.

  ## Examples

      iex> list_user_profiles()
      [%UserProfile{}, ...]

  """
  def list_user_profiles do
    Repo.all(UserProfile)
  end

  @doc """
  Gets a single user_profile.

  Raises `Ecto.NoResultsError` if the User profile does not exist.

  ## Examples

      iex> get_user_profile!(123)
      %UserProfile{}

      iex> get_user_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_profile!(id), do: Repo.get!(UserProfile, id)

  @doc """
  Creates a user_profile.

  ## Examples

      iex> create_user_profile(%{field: value})
      {:ok, %UserProfile{}}

      iex> create_user_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_profile(attrs \\ %{}) do
    %UserProfile{}
    |> UserProfile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_profile.

  ## Examples

      iex> update_user_profile(user_profile, %{field: new_value})
      {:ok, %UserProfile{}}

      iex> update_user_profile(user_profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_profile(%UserProfile{} = user_profile, attrs) do
    user_profile
    |> UserProfile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_profile.

  ## Examples

      iex> delete_user_profile(user_profile)
      {:ok, %UserProfile{}}

      iex> delete_user_profile(user_profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_profile(%UserProfile{} = user_profile) do
    Repo.delete(user_profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_profile changes.

  ## Examples

      iex> change_user_profile(user_profile)
      %Ecto.Changeset{data: %UserProfile{}}

  """
  def change_user_profile(%UserProfile{} = user_profile, attrs \\ %{}) do
    UserProfile.changeset(user_profile, attrs)
  end

  alias Eshop.Users.Role

  @doc """
  Returns the list of roles.

  ## Examples

      iex> list_roles()
      [%Role{}, ...]

  """
  def list_roles do
    Repo.all(Role)
  end

  @doc """
  Gets a single role.

  Raises `Ecto.NoResultsError` if the Role does not exist.

  ## Examples

      iex> get_role!(123)
      %Role{}

      iex> get_role!(456)
      ** (Ecto.NoResultsError)

  """
  def get_role!(id), do: Repo.get!(Role, id)

  @doc """
  Creates a role.

  ## Examples

      iex> create_role(%{field: value})
      {:ok, %Role{}}

      iex> create_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_role(attrs \\ %{}) do
    %Role{}
    |> Role.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a role.

  ## Examples

      iex> update_role(role, %{field: new_value})
      {:ok, %Role{}}

      iex> update_role(role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_role(%Role{} = role, attrs) do
    role
    |> Role.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a role.

  ## Examples

      iex> delete_role(role)
      {:ok, %Role{}}

      iex> delete_role(role)
      {:error, %Ecto.Changeset{}}

  """
  def delete_role(%Role{} = role) do
    Repo.delete(role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking role changes.

  ## Examples

      iex> change_role(role)
      %Ecto.Changeset{data: %Role{}}

  """
  def change_role(%Role{} = role, attrs \\ %{}) do
    Role.changeset(role, attrs)
  end

  alias Eshop.Users.Permission

  @doc """
  Returns the list of permissions.

  ## Examples

      iex> list_permissions()
      [%Permission{}, ...]

  """
  def list_permissions do
    Repo.all(Permission)
  end

  @doc """
  Gets a single permission.

  Raises `Ecto.NoResultsError` if the Permission does not exist.

  ## Examples

      iex> get_permission!(123)
      %Permission{}

      iex> get_permission!(456)
      ** (Ecto.NoResultsError)

  """
  def get_permission!(id), do: Repo.get!(Permission, id)

  @doc """
  Creates a permission.

  ## Examples

      iex> create_permission(%{field: value})
      {:ok, %Permission{}}

      iex> create_permission(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_permission(attrs \\ %{}) do
    %Permission{}
    |> Permission.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a permission.

  ## Examples

      iex> update_permission(permission, %{field: new_value})
      {:ok, %Permission{}}

      iex> update_permission(permission, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_permission(%Permission{} = permission, attrs) do
    permission
    |> Permission.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a permission.

  ## Examples

      iex> delete_permission(permission)
      {:ok, %Permission{}}

      iex> delete_permission(permission)
      {:error, %Ecto.Changeset{}}

  """
  def delete_permission(%Permission{} = permission) do
    Repo.delete(permission)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking permission changes.

  ## Examples

      iex> change_permission(permission)
      %Ecto.Changeset{data: %Permission{}}

  """
  def change_permission(%Permission{} = permission, attrs \\ %{}) do
    Permission.changeset(permission, attrs)
  end

  alias Eshop.Users.RolePermission

  @doc """
  Returns the list of role_permissions.

  ## Examples

      iex> list_role_permissions()
      [%RolePermission{}, ...]

  """
  def list_role_permissions do
    Repo.all(RolePermission)
  end

  @doc """
  Gets a single role_permission.

  Raises `Ecto.NoResultsError` if the Role permission does not exist.

  ## Examples

      iex> get_role_permission!(123)
      %RolePermission{}

      iex> get_role_permission!(456)
      ** (Ecto.NoResultsError)

  """
  def get_role_permission!(id), do: Repo.get!(RolePermission, id)

  @doc """
  Creates a role_permission.

  ## Examples

      iex> create_role_permission(%{field: value})
      {:ok, %RolePermission{}}

      iex> create_role_permission(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_role_permission(attrs \\ %{}) do
    %RolePermission{}
    |> RolePermission.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a role_permission.

  ## Examples

      iex> update_role_permission(role_permission, %{field: new_value})
      {:ok, %RolePermission{}}

      iex> update_role_permission(role_permission, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_role_permission(%RolePermission{} = role_permission, attrs) do
    role_permission
    |> RolePermission.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a role_permission.

  ## Examples

      iex> delete_role_permission(role_permission)
      {:ok, %RolePermission{}}

      iex> delete_role_permission(role_permission)
      {:error, %Ecto.Changeset{}}

  """
  def delete_role_permission(%RolePermission{} = role_permission) do
    Repo.delete(role_permission)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking role_permission changes.

  ## Examples

      iex> change_role_permission(role_permission)
      %Ecto.Changeset{data: %RolePermission{}}

  """
  def change_role_permission(%RolePermission{} = role_permission, attrs \\ %{}) do
    RolePermission.changeset(role_permission, attrs)
  end

  alias Eshop.Users.UserRole

  @doc """
  Returns the list of user_roles.

  ## Examples

      iex> list_user_roles()
      [%UserRole{}, ...]

  """
  def list_user_roles do
    Repo.all(UserRole)
  end

  @doc """
  Gets a single user_role.

  Raises `Ecto.NoResultsError` if the User role does not exist.

  ## Examples

      iex> get_user_role!(123)
      %UserRole{}

      iex> get_user_role!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_role!(id), do: Repo.get!(UserRole, id)

  @doc """
  Creates a user_role.

  ## Examples

      iex> create_user_role(%{field: value})
      {:ok, %UserRole{}}

      iex> create_user_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_role(attrs \\ %{}) do
    %UserRole{}
    |> UserRole.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_role.

  ## Examples

      iex> update_user_role(user_role, %{field: new_value})
      {:ok, %UserRole{}}

      iex> update_user_role(user_role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_role(%UserRole{} = user_role, attrs) do
    user_role
    |> UserRole.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_role.

  ## Examples

      iex> delete_user_role(user_role)
      {:ok, %UserRole{}}

      iex> delete_user_role(user_role)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_role(%UserRole{} = user_role) do
    Repo.delete(user_role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_role changes.

  ## Examples

      iex> change_user_role(user_role)
      %Ecto.Changeset{data: %UserRole{}}

  """
  def change_user_role(%UserRole{} = user_role, attrs \\ %{}) do
    UserRole.changeset(user_role, attrs)
  end

  alias Eshop.Users.UserPermission

  @doc """
  Returns the list of user_permissions.

  ## Examples

      iex> list_user_permissions()
      [%UserPermission{}, ...]

  """
  def list_user_permissions do
    Repo.all(UserPermission)
  end

  @doc """
  Gets a single user_permission.

  Raises `Ecto.NoResultsError` if the User permission does not exist.

  ## Examples

      iex> get_user_permission!(123)
      %UserPermission{}

      iex> get_user_permission!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_permission!(id), do: Repo.get!(UserPermission, id)

  @doc """
  Creates a user_permission.

  ## Examples

      iex> create_user_permission(%{field: value})
      {:ok, %UserPermission{}}

      iex> create_user_permission(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_permission(attrs \\ %{}) do
    %UserPermission{}
    |> UserPermission.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_permission.

  ## Examples

      iex> update_user_permission(user_permission, %{field: new_value})
      {:ok, %UserPermission{}}

      iex> update_user_permission(user_permission, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_permission(%UserPermission{} = user_permission, attrs) do
    user_permission
    |> UserPermission.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_permission.

  ## Examples

      iex> delete_user_permission(user_permission)
      {:ok, %UserPermission{}}

      iex> delete_user_permission(user_permission)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_permission(%UserPermission{} = user_permission) do
    Repo.delete(user_permission)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_permission changes.

  ## Examples

      iex> change_user_permission(user_permission)
      %Ecto.Changeset{data: %UserPermission{}}

  """
  def change_user_permission(%UserPermission{} = user_permission, attrs \\ %{}) do
    UserPermission.changeset(user_permission, attrs)
  end

  alias Eshop.Users.PasswordReset

  @doc """
  Returns the list of password_resets.

  ## Examples

      iex> list_password_resets()
      [%PasswordReset{}, ...]

  """
  def list_password_resets do
    Repo.all(PasswordReset)
  end

  @doc """
  Gets a single password_reset.

  Raises `Ecto.NoResultsError` if the Password reset does not exist.

  ## Examples

      iex> get_password_reset!(123)
      %PasswordReset{}

      iex> get_password_reset!(456)
      ** (Ecto.NoResultsError)

  """
  def get_password_reset!(id), do: Repo.get!(PasswordReset, id)

  @doc """
  Creates a password_reset.

  ## Examples

      iex> create_password_reset(%{field: value})
      {:ok, %PasswordReset{}}

      iex> create_password_reset(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_password_reset(attrs \\ %{}) do
    %PasswordReset{}
    |> PasswordReset.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a password_reset.

  ## Examples

      iex> update_password_reset(password_reset, %{field: new_value})
      {:ok, %PasswordReset{}}

      iex> update_password_reset(password_reset, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_password_reset(%PasswordReset{} = password_reset, attrs) do
    password_reset
    |> PasswordReset.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a password_reset.

  ## Examples

      iex> delete_password_reset(password_reset)
      {:ok, %PasswordReset{}}

      iex> delete_password_reset(password_reset)
      {:error, %Ecto.Changeset{}}

  """
  def delete_password_reset(%PasswordReset{} = password_reset) do
    Repo.delete(password_reset)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking password_reset changes.

  ## Examples

      iex> change_password_reset(password_reset)
      %Ecto.Changeset{data: %PasswordReset{}}

  """
  def change_password_reset(%PasswordReset{} = password_reset, attrs \\ %{}) do
    PasswordReset.changeset(password_reset, attrs)
  end

  alias Eshop.Users.LoginDetail

  @doc """
  Returns the list of login_details.

  ## Examples

      iex> list_login_details()
      [%LoginDetail{}, ...]

  """
  def list_login_details do
    Repo.all(LoginDetail)
  end

  @doc """
  Gets a single login_detail.

  Raises `Ecto.NoResultsError` if the Login detail does not exist.

  ## Examples

      iex> get_login_detail!(123)
      %LoginDetail{}

      iex> get_login_detail!(456)
      ** (Ecto.NoResultsError)

  """
  def get_login_detail!(id), do: Repo.get!(LoginDetail, id)

  @doc """
  Creates a login_detail.

  ## Examples

      iex> create_login_detail(%{field: value})
      {:ok, %LoginDetail{}}

      iex> create_login_detail(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_login_detail(attrs \\ %{}) do
    %LoginDetail{}
    |> LoginDetail.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a login_detail.

  ## Examples

      iex> update_login_detail(login_detail, %{field: new_value})
      {:ok, %LoginDetail{}}

      iex> update_login_detail(login_detail, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_login_detail(%LoginDetail{} = login_detail, attrs) do
    login_detail
    |> LoginDetail.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a login_detail.

  ## Examples

      iex> delete_login_detail(login_detail)
      {:ok, %LoginDetail{}}

      iex> delete_login_detail(login_detail)
      {:error, %Ecto.Changeset{}}

  """
  def delete_login_detail(%LoginDetail{} = login_detail) do
    Repo.delete(login_detail)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking login_detail changes.

  ## Examples

      iex> change_login_detail(login_detail)
      %Ecto.Changeset{data: %LoginDetail{}}

  """
  def change_login_detail(%LoginDetail{} = login_detail, attrs \\ %{}) do
    LoginDetail.changeset(login_detail, attrs)
  end

  alias Eshop.Users.UpdateHistory

  @doc """
  Returns the list of update_histories.

  ## Examples

      iex> list_update_histories()
      [%UpdateHistory{}, ...]

  """
  def list_update_histories do
    Repo.all(UpdateHistory)
  end

  @doc """
  Gets a single update_history.

  Raises `Ecto.NoResultsError` if the Update history does not exist.

  ## Examples

      iex> get_update_history!(123)
      %UpdateHistory{}

      iex> get_update_history!(456)
      ** (Ecto.NoResultsError)

  """
  def get_update_history!(id), do: Repo.get!(UpdateHistory, id)

  @doc """
  Creates a update_history.

  ## Examples

      iex> create_update_history(%{field: value})
      {:ok, %UpdateHistory{}}

      iex> create_update_history(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_update_history(attrs \\ %{}) do
    %UpdateHistory{}
    |> UpdateHistory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a update_history.

  ## Examples

      iex> update_update_history(update_history, %{field: new_value})
      {:ok, %UpdateHistory{}}

      iex> update_update_history(update_history, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_update_history(%UpdateHistory{} = update_history, attrs) do
    update_history
    |> UpdateHistory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a update_history.

  ## Examples

      iex> delete_update_history(update_history)
      {:ok, %UpdateHistory{}}

      iex> delete_update_history(update_history)
      {:error, %Ecto.Changeset{}}

  """
  def delete_update_history(%UpdateHistory{} = update_history) do
    Repo.delete(update_history)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking update_history changes.

  ## Examples

      iex> change_update_history(update_history)
      %Ecto.Changeset{data: %UpdateHistory{}}

  """
  def change_update_history(%UpdateHistory{} = update_history, attrs \\ %{}) do
    UpdateHistory.changeset(update_history, attrs)
  end
end
