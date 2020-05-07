alias Eshop.Repo
alias Eshop.Users.User

%User{
  first_name: "Shuvo Shaha",
  last_name: "Shuvo",
  email: "DDtheshuvo.01@gmail.com",
  mobile: "420420420420",
  password: "rakib",
  password_confirmation: "rakib",
} 
|> Repo.insert()