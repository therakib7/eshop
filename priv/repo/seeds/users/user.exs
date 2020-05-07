alias Eshop.Repo
alias Eshop.Users.User

%User{
  first_name: "Shuvo Shaha",
  last_name: "Shuvo",
  email: "theshuvo.01@gmail.com",
  mobile: "420420420420",
  password_hash: "98s90fw54j23908sdfiscDDxsf"
} |> Repo.insert!
