#!/bin/bash
# 日本語版のインストール
wp core update --locale=ja --force

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

# カテゴリー名を日本語に変更
wp term update category 1 --name='未分類'

# リライトルールを更新
wp rewrite flush

# 必要なプラグインインストール
wp plugin install wp-multibyte-patch --activate

# Mailhog メールが文字化けしないよう WP Multibyte Patch の設定調整
# https://eastcoder.com/code/wp-multibyte-patch/
echo "<?php
\$wpmp_conf['mail_mode'] = 'UTF-8';
\$wpmp_conf['patch_wp_mail'] = false;
" >> wp-content/wpmp-config.php
