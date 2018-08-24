# https://qiita.com/kompiro/items/0504c70eb8f522e1f66a
client = Octokit::Client.new login: Setting.github.[:user_name], Setting.github.[:password]

p client.user # GitHub上のユーザー情報を取得
# token = client.create_authorization(:scopes => ["user"], :headers => { "X-GitHub-OTP" => "<your 2FA token>", :note => "<name of token>" })
# => <your new oauth token>
# client = Octokit::Client.new access_token: token