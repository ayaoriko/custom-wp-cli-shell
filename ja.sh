#!/bin/bash
# ベータ版への変更
wp --allow-root core update --locale=ja --force

# サイトの言語を設定
wp --allow-root core language install ja --activate

# タイムゾーンを設定
wp --allow-root option update timezone_string 'Asia/Tokyo'

# 日付フォーマットを設定
wp --allow-root option update date_format 'Y-m-d'

# 時刻フォーマットを設定
wp --allow-root option update time_format 'H:i'

# パーマリンクを投稿名に設定
wp --allow-root rewrite structure '/%postname%/'

# リライトルールを更新
wp --allow-root rewrite flush

# 必要なプラグインインストール
wp --allow-root plugin install wp-multibyte-patch --activate

# Mailhog メールが文字化けしないよう WP Multibyte Patch の設定調整
# https://eastcoder.com/code/wp-multibyte-patch/
echo "<?php
\$wpmp_conf['mail_mode'] = 'UTF-8';
\$wpmp_conf['patch_wp_mail'] = false;
" >> wp-content/wpmp-config.php
