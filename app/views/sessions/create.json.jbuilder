json.session do
  cache @user do
    json.(@user, :id, :name, :admin)
    json.token @user.authentication_token
  end
end