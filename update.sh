# アップデート
wp core update --locale=ja --nightly

# 古いバージョンにダウングレード
# wp core update --version=5.3 --force

# ベータ版から通常版へのダウングレード
# wp core update --version=latest --force

# DB更新
wp core update-db

# 翻訳ファイルのアップデート
wp core language update

# プラグイン全更新
wp plugin update --all