#!/bin/bash

# ベータ版への変更
wp core update --locale=ja --version=nightly

# ベータ版を通常版に戻す
# wp core update --version=latest --force

# カテゴリー名を日本語に変更
wp term update category 1 --name='未分類'

# サイトの言語を設定
wp core language install ja --activate

# タイムゾーンを設定
wp option update timezone_string 'Asia/Tokyo'

# 日付フォーマットを設定
wp option update date_format 'Y-m-d'

# 時刻フォーマットを設定
wp option update time_format 'H:i'

# パーマリンクを投稿名に設定
wp rewrite structure '/%postname%/'

# リライトルールを更新
wp rewrite flush

# サンプルの投稿、固定ページを削除
wp post delete 1 2 3 --force

# サンプルのコメントを削除
wp comment delete 1 --force

# デバッグモードをtrueにする
wp config set WP_DEBUG true --raw

#フロントページの表示を固定ページに変更をする
wp option update show_on_front 'page'

# トップページを作成して表示設定
wp option update page_on_front $(wp post create --post_type=page --post_title="トップページ" --post_status=Publish --porcelain)

# 固定ページを作成して表示設定
wp option update page_for_posts $(wp post create --post_type=page --post_title="投稿ページ" --post_status=Publish --porcelain)

# テーマを全削除
wp theme delete --all --force

# プラグインを一旦すべて削除する
wp plugin delete --all

# 必要なプラグインインストール
wp plugin install wp-multibyte-patch --activate
wp plugin install theme-check --activate
wp plugin install wp-reset --activate
wp plugin install all-in-one-wp-migration --activate

# Mailhog メールが文字化けしないよう WP Multibyte Patch の設定調整
# https://eastcoder.com/code/wp-multibyte-patch/
echo "<?php
\$wpmp_conf['mail_mode'] = 'UTF-8';
\$wpmp_conf['patch_wp_mail'] = false;
?>
" >> wp-content/wpmp-config.php
