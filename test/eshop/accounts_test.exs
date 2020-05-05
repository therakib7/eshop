defmodule Eshop.AccountsTest do
  use Eshop.DataCase

  alias Eshop.Accounts

  describe "users" do
    alias Eshop.Accounts.User

    @valid_attrs %{email: "some email", first_name: "some first_name", is_active: true, last_name: "some last_name", mobile: "some mobile", password_hash: "some password_hash", pin: 42, verified_email: ~N[2010-04-17 14:00:00], verified_phone: ~N[2010-04-17 14:00:00], verified_user: ~N[2010-04-17 14:00:00]}
    @update_attrs %{email: "some updated email", first_name: "some updated first_name", is_active: false, last_name: "some updated last_name", mobile: "some updated mobile", password_hash: "some updated password_hash", pin: 43, verified_email: ~N[2011-05-18 15:01:01], verified_phone: ~N[2011-05-18 15:01:01], verified_user: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{email: nil, first_name: nil, is_active: nil, last_name: nil, mobile: nil, password_hash: nil, pin: nil, verified_email: nil, verified_phone: nil, verified_user: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.is_active == true
      assert user.last_name == "some last_name"
      assert user.mobile == "some mobile"
      assert user.password_hash == "some password_hash"
      assert user.pin == 42
      assert user.verified_email == ~N[2010-04-17 14:00:00]
      assert user.verified_phone == ~N[2010-04-17 14:00:00]
      assert user.verified_user == ~N[2010-04-17 14:00:00]
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.is_active == false
      assert user.last_name == "some updated last_name"
      assert user.mobile == "some updated mobile"
      assert user.password_hash == "some updated password_hash"
      assert user.pin == 43
      assert user.verified_email == ~N[2011-05-18 15:01:01]
      assert user.verified_phone == ~N[2011-05-18 15:01:01]
      assert user.verified_user == ~N[2011-05-18 15:01:01]
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "user_profiles" do
    alias Eshop.Accounts.UserProfile

    @valid_attrs %{date_of_birth: "some date_of_birth", gender: 42, integer: "some integer", lat: 120.5, long: 120.5, merital_status: "some merital_status", utc_datetime: "some utc_datetime"}
    @update_attrs %{date_of_birth: "some updated date_of_birth", gender: 43, integer: "some updated integer", lat: 456.7, long: 456.7, merital_status: "some updated merital_status", utc_datetime: "some updated utc_datetime"}
    @invalid_attrs %{date_of_birth: nil, gender: nil, integer: nil, lat: nil, long: nil, merital_status: nil, utc_datetime: nil}

    def user_profile_fixture(attrs \\ %{}) do
      {:ok, user_profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_profile()

      user_profile
    end

    test "list_user_profiles/0 returns all user_profiles" do
      user_profile = user_profile_fixture()
      assert Accounts.list_user_profiles() == [user_profile]
    end

    test "get_user_profile!/1 returns the user_profile with given id" do
      user_profile = user_profile_fixture()
      assert Accounts.get_user_profile!(user_profile.id) == user_profile
    end

    test "create_user_profile/1 with valid data creates a user_profile" do
      assert {:ok, %UserProfile{} = user_profile} = Accounts.create_user_profile(@valid_attrs)
      assert user_profile.date_of_birth == "some date_of_birth"
      assert user_profile.gender == 42
      assert user_profile.integer == "some integer"
      assert user_profile.lat == 120.5
      assert user_profile.long == 120.5
      assert user_profile.merital_status == "some merital_status"
      assert user_profile.utc_datetime == "some utc_datetime"
    end

    test "create_user_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_profile(@invalid_attrs)
    end

    test "update_user_profile/2 with valid data updates the user_profile" do
      user_profile = user_profile_fixture()
      assert {:ok, %UserProfile{} = user_profile} = Accounts.update_user_profile(user_profile, @update_attrs)
      assert user_profile.date_of_birth == "some updated date_of_birth"
      assert user_profile.gender == 43
      assert user_profile.integer == "some updated integer"
      assert user_profile.lat == 456.7
      assert user_profile.long == 456.7
      assert user_profile.merital_status == "some updated merital_status"
      assert user_profile.utc_datetime == "some updated utc_datetime"
    end

    test "update_user_profile/2 with invalid data returns error changeset" do
      user_profile = user_profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_profile(user_profile, @invalid_attrs)
      assert user_profile == Accounts.get_user_profile!(user_profile.id)
    end

    test "delete_user_profile/1 deletes the user_profile" do
      user_profile = user_profile_fixture()
      assert {:ok, %UserProfile{}} = Accounts.delete_user_profile(user_profile)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_profile!(user_profile.id) end
    end

    test "change_user_profile/1 returns a user_profile changeset" do
      user_profile = user_profile_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_profile(user_profile)
    end
  end

  describe "roles" do
    alias Eshop.Accounts.Role

    @valid_attrs %{desc: "some desc", is_company: true, name: "some name", native_name: "some native_name"}
    @update_attrs %{desc: "some updated desc", is_company: false, name: "some updated name", native_name: "some updated native_name"}
    @invalid_attrs %{desc: nil, is_company: nil, name: nil, native_name: nil}

    def role_fixture(attrs \\ %{}) do
      {:ok, role} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_role()

      role
    end

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Accounts.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Accounts.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      assert {:ok, %Role{} = role} = Accounts.create_role(@valid_attrs)
      assert role.desc == "some desc"
      assert role.is_company == true
      assert role.name == "some name"
      assert role.native_name == "some native_name"
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      assert {:ok, %Role{} = role} = Accounts.update_role(role, @update_attrs)
      assert role.desc == "some updated desc"
      assert role.is_company == false
      assert role.name == "some updated name"
      assert role.native_name == "some updated native_name"
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_role(role, @invalid_attrs)
      assert role == Accounts.get_role!(role.id)
    end

    test "delete_role/1 deletes the role" do
      role = role_fixture()
      assert {:ok, %Role{}} = Accounts.delete_role(role)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_role!(role.id) end
    end

    test "change_role/1 returns a role changeset" do
      role = role_fixture()
      assert %Ecto.Changeset{} = Accounts.change_role(role)
    end
  end

  describe "permissions" do
    alias Eshop.Accounts.Permission

    @valid_attrs %{name: "some name", slug: "some slug"}
    @update_attrs %{name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{name: nil, slug: nil}

    def permission_fixture(attrs \\ %{}) do
      {:ok, permission} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_permission()

      permission
    end

    test "list_permissions/0 returns all permissions" do
      permission = permission_fixture()
      assert Accounts.list_permissions() == [permission]
    end

    test "get_permission!/1 returns the permission with given id" do
      permission = permission_fixture()
      assert Accounts.get_permission!(permission.id) == permission
    end

    test "create_permission/1 with valid data creates a permission" do
      assert {:ok, %Permission{} = permission} = Accounts.create_permission(@valid_attrs)
      assert permission.name == "some name"
      assert permission.slug == "some slug"
    end

    test "create_permission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_permission(@invalid_attrs)
    end

    test "update_permission/2 with valid data updates the permission" do
      permission = permission_fixture()
      assert {:ok, %Permission{} = permission} = Accounts.update_permission(permission, @update_attrs)
      assert permission.name == "some updated name"
      assert permission.slug == "some updated slug"
    end

    test "update_permission/2 with invalid data returns error changeset" do
      permission = permission_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_permission(permission, @invalid_attrs)
      assert permission == Accounts.get_permission!(permission.id)
    end

    test "delete_permission/1 deletes the permission" do
      permission = permission_fixture()
      assert {:ok, %Permission{}} = Accounts.delete_permission(permission)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_permission!(permission.id) end
    end

    test "change_permission/1 returns a permission changeset" do
      permission = permission_fixture()
      assert %Ecto.Changeset{} = Accounts.change_permission(permission)
    end
  end

  describe "role_permissions" do
    alias Eshop.Accounts.RolePermission

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def role_permission_fixture(attrs \\ %{}) do
      {:ok, role_permission} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_role_permission()

      role_permission
    end

    test "list_role_permissions/0 returns all role_permissions" do
      role_permission = role_permission_fixture()
      assert Accounts.list_role_permissions() == [role_permission]
    end

    test "get_role_permission!/1 returns the role_permission with given id" do
      role_permission = role_permission_fixture()
      assert Accounts.get_role_permission!(role_permission.id) == role_permission
    end

    test "create_role_permission/1 with valid data creates a role_permission" do
      assert {:ok, %RolePermission{} = role_permission} = Accounts.create_role_permission(@valid_attrs)
    end

    test "create_role_permission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_role_permission(@invalid_attrs)
    end

    test "update_role_permission/2 with valid data updates the role_permission" do
      role_permission = role_permission_fixture()
      assert {:ok, %RolePermission{} = role_permission} = Accounts.update_role_permission(role_permission, @update_attrs)
    end

    test "update_role_permission/2 with invalid data returns error changeset" do
      role_permission = role_permission_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_role_permission(role_permission, @invalid_attrs)
      assert role_permission == Accounts.get_role_permission!(role_permission.id)
    end

    test "delete_role_permission/1 deletes the role_permission" do
      role_permission = role_permission_fixture()
      assert {:ok, %RolePermission{}} = Accounts.delete_role_permission(role_permission)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_role_permission!(role_permission.id) end
    end

    test "change_role_permission/1 returns a role_permission changeset" do
      role_permission = role_permission_fixture()
      assert %Ecto.Changeset{} = Accounts.change_role_permission(role_permission)
    end
  end

  describe "user_roles" do
    alias Eshop.Accounts.UserRole

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_role_fixture(attrs \\ %{}) do
      {:ok, user_role} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_role()

      user_role
    end

    test "list_user_roles/0 returns all user_roles" do
      user_role = user_role_fixture()
      assert Accounts.list_user_roles() == [user_role]
    end

    test "get_user_role!/1 returns the user_role with given id" do
      user_role = user_role_fixture()
      assert Accounts.get_user_role!(user_role.id) == user_role
    end

    test "create_user_role/1 with valid data creates a user_role" do
      assert {:ok, %UserRole{} = user_role} = Accounts.create_user_role(@valid_attrs)
    end

    test "create_user_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_role(@invalid_attrs)
    end

    test "update_user_role/2 with valid data updates the user_role" do
      user_role = user_role_fixture()
      assert {:ok, %UserRole{} = user_role} = Accounts.update_user_role(user_role, @update_attrs)
    end

    test "update_user_role/2 with invalid data returns error changeset" do
      user_role = user_role_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_role(user_role, @invalid_attrs)
      assert user_role == Accounts.get_user_role!(user_role.id)
    end

    test "delete_user_role/1 deletes the user_role" do
      user_role = user_role_fixture()
      assert {:ok, %UserRole{}} = Accounts.delete_user_role(user_role)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_role!(user_role.id) end
    end

    test "change_user_role/1 returns a user_role changeset" do
      user_role = user_role_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_role(user_role)
    end
  end

  describe "user_permissions" do
    alias Eshop.Accounts.UserPermission

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_permission_fixture(attrs \\ %{}) do
      {:ok, user_permission} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_permission()

      user_permission
    end

    test "list_user_permissions/0 returns all user_permissions" do
      user_permission = user_permission_fixture()
      assert Accounts.list_user_permissions() == [user_permission]
    end

    test "get_user_permission!/1 returns the user_permission with given id" do
      user_permission = user_permission_fixture()
      assert Accounts.get_user_permission!(user_permission.id) == user_permission
    end

    test "create_user_permission/1 with valid data creates a user_permission" do
      assert {:ok, %UserPermission{} = user_permission} = Accounts.create_user_permission(@valid_attrs)
    end

    test "create_user_permission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_permission(@invalid_attrs)
    end

    test "update_user_permission/2 with valid data updates the user_permission" do
      user_permission = user_permission_fixture()
      assert {:ok, %UserPermission{} = user_permission} = Accounts.update_user_permission(user_permission, @update_attrs)
    end

    test "update_user_permission/2 with invalid data returns error changeset" do
      user_permission = user_permission_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_permission(user_permission, @invalid_attrs)
      assert user_permission == Accounts.get_user_permission!(user_permission.id)
    end

    test "delete_user_permission/1 deletes the user_permission" do
      user_permission = user_permission_fixture()
      assert {:ok, %UserPermission{}} = Accounts.delete_user_permission(user_permission)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_permission!(user_permission.id) end
    end

    test "change_user_permission/1 returns a user_permission changeset" do
      user_permission = user_permission_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_permission(user_permission)
    end
  end

  describe "password_resets" do
    alias Eshop.Accounts.PasswordReset

    @valid_attrs %{created_at: "2010-04-17T14:00:00Z", token: "some token"}
    @update_attrs %{created_at: "2011-05-18T15:01:01Z", token: "some updated token"}
    @invalid_attrs %{created_at: nil, token: nil}

    def password_reset_fixture(attrs \\ %{}) do
      {:ok, password_reset} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_password_reset()

      password_reset
    end

    test "list_password_resets/0 returns all password_resets" do
      password_reset = password_reset_fixture()
      assert Accounts.list_password_resets() == [password_reset]
    end

    test "get_password_reset!/1 returns the password_reset with given id" do
      password_reset = password_reset_fixture()
      assert Accounts.get_password_reset!(password_reset.id) == password_reset
    end

    test "create_password_reset/1 with valid data creates a password_reset" do
      assert {:ok, %PasswordReset{} = password_reset} = Accounts.create_password_reset(@valid_attrs)
      assert password_reset.created_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert password_reset.token == "some token"
    end

    test "create_password_reset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_password_reset(@invalid_attrs)
    end

    test "update_password_reset/2 with valid data updates the password_reset" do
      password_reset = password_reset_fixture()
      assert {:ok, %PasswordReset{} = password_reset} = Accounts.update_password_reset(password_reset, @update_attrs)
      assert password_reset.created_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert password_reset.token == "some updated token"
    end

    test "update_password_reset/2 with invalid data returns error changeset" do
      password_reset = password_reset_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_password_reset(password_reset, @invalid_attrs)
      assert password_reset == Accounts.get_password_reset!(password_reset.id)
    end

    test "delete_password_reset/1 deletes the password_reset" do
      password_reset = password_reset_fixture()
      assert {:ok, %PasswordReset{}} = Accounts.delete_password_reset(password_reset)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_password_reset!(password_reset.id) end
    end

    test "change_password_reset/1 returns a password_reset changeset" do
      password_reset = password_reset_fixture()
      assert %Ecto.Changeset{} = Accounts.change_password_reset(password_reset)
    end
  end

  describe "login_details" do
    alias Eshop.Accounts.LoginDetail

    @valid_attrs %{ip_address: "some ip_address", ip_location: "some ip_location", is_active: true, last_activity: "2010-04-17T14:00:00Z", login_at: "2010-04-17T14:00:00Z", user_agent: "some user_agent"}
    @update_attrs %{ip_address: "some updated ip_address", ip_location: "some updated ip_location", is_active: false, last_activity: "2011-05-18T15:01:01Z", login_at: "2011-05-18T15:01:01Z", user_agent: "some updated user_agent"}
    @invalid_attrs %{ip_address: nil, ip_location: nil, is_active: nil, last_activity: nil, login_at: nil, user_agent: nil}

    def login_detail_fixture(attrs \\ %{}) do
      {:ok, login_detail} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_login_detail()

      login_detail
    end

    test "list_login_details/0 returns all login_details" do
      login_detail = login_detail_fixture()
      assert Accounts.list_login_details() == [login_detail]
    end

    test "get_login_detail!/1 returns the login_detail with given id" do
      login_detail = login_detail_fixture()
      assert Accounts.get_login_detail!(login_detail.id) == login_detail
    end

    test "create_login_detail/1 with valid data creates a login_detail" do
      assert {:ok, %LoginDetail{} = login_detail} = Accounts.create_login_detail(@valid_attrs)
      assert login_detail.ip_address == "some ip_address"
      assert login_detail.ip_location == "some ip_location"
      assert login_detail.is_active == true
      assert login_detail.last_activity == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert login_detail.login_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert login_detail.user_agent == "some user_agent"
    end

    test "create_login_detail/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_login_detail(@invalid_attrs)
    end

    test "update_login_detail/2 with valid data updates the login_detail" do
      login_detail = login_detail_fixture()
      assert {:ok, %LoginDetail{} = login_detail} = Accounts.update_login_detail(login_detail, @update_attrs)
      assert login_detail.ip_address == "some updated ip_address"
      assert login_detail.ip_location == "some updated ip_location"
      assert login_detail.is_active == false
      assert login_detail.last_activity == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert login_detail.login_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert login_detail.user_agent == "some updated user_agent"
    end

    test "update_login_detail/2 with invalid data returns error changeset" do
      login_detail = login_detail_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_login_detail(login_detail, @invalid_attrs)
      assert login_detail == Accounts.get_login_detail!(login_detail.id)
    end

    test "delete_login_detail/1 deletes the login_detail" do
      login_detail = login_detail_fixture()
      assert {:ok, %LoginDetail{}} = Accounts.delete_login_detail(login_detail)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_login_detail!(login_detail.id) end
    end

    test "change_login_detail/1 returns a login_detail changeset" do
      login_detail = login_detail_fixture()
      assert %Ecto.Changeset{} = Accounts.change_login_detail(login_detail)
    end
  end

  describe "update_histories" do
    alias Eshop.Accounts.UpdateHistory

    @valid_attrs %{created_at: "2010-04-17T14:00:00Z", key: "some key", new_value: "some new_value", old_value: "some old_value", type: 42, type_id: 42}
    @update_attrs %{created_at: "2011-05-18T15:01:01Z", key: "some updated key", new_value: "some updated new_value", old_value: "some updated old_value", type: 43, type_id: 43}
    @invalid_attrs %{created_at: nil, key: nil, new_value: nil, old_value: nil, type: nil, type_id: nil}

    def update_history_fixture(attrs \\ %{}) do
      {:ok, update_history} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_update_history()

      update_history
    end

    test "list_update_histories/0 returns all update_histories" do
      update_history = update_history_fixture()
      assert Accounts.list_update_histories() == [update_history]
    end

    test "get_update_history!/1 returns the update_history with given id" do
      update_history = update_history_fixture()
      assert Accounts.get_update_history!(update_history.id) == update_history
    end

    test "create_update_history/1 with valid data creates a update_history" do
      assert {:ok, %UpdateHistory{} = update_history} = Accounts.create_update_history(@valid_attrs)
      assert update_history.created_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert update_history.key == "some key"
      assert update_history.new_value == "some new_value"
      assert update_history.old_value == "some old_value"
      assert update_history.type == 42
      assert update_history.type_id == 42
    end

    test "create_update_history/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_update_history(@invalid_attrs)
    end

    test "update_update_history/2 with valid data updates the update_history" do
      update_history = update_history_fixture()
      assert {:ok, %UpdateHistory{} = update_history} = Accounts.update_update_history(update_history, @update_attrs)
      assert update_history.created_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert update_history.key == "some updated key"
      assert update_history.new_value == "some updated new_value"
      assert update_history.old_value == "some updated old_value"
      assert update_history.type == 43
      assert update_history.type_id == 43
    end

    test "update_update_history/2 with invalid data returns error changeset" do
      update_history = update_history_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_update_history(update_history, @invalid_attrs)
      assert update_history == Accounts.get_update_history!(update_history.id)
    end

    test "delete_update_history/1 deletes the update_history" do
      update_history = update_history_fixture()
      assert {:ok, %UpdateHistory{}} = Accounts.delete_update_history(update_history)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_update_history!(update_history.id) end
    end

    test "change_update_history/1 returns a update_history changeset" do
      update_history = update_history_fixture()
      assert %Ecto.Changeset{} = Accounts.change_update_history(update_history)
    end
  end
end
