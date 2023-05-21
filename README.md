# wp-cli
Local by Flywheel（Local） で新規作成した WordPress サイトを初期化および日本語化するスクリプトです。

経緯等のブログはコチラです。
https://ayaoriko.com/coding/wordpress/custom-wp-cli-shell/

## 参考サイト、および参考のGit
https://github.com/ko31/init-local-by-flywheel
https://wp.go-sign.info/init-local-by-flywheel-to-ja/


## 基本的な使い方

WordPressのインストール直後に実行

```Shell
wp eval 'exec(file_get_contents("https://raw.githubusercontent.com/ayaoriko/custom-wp-cli-shell/master/init.sh")." > /dev/null", $output); printf("%s\n", implode("\n", $output));'
```

テーマを作成したあとに実行
```Shell
wp theme activate テーマファイル名
```

## その他

日本語に関する最低限の初期設定(日本語版再インストール、言語設定、日付設定、パーマリンク、wp-multibyte-patchのインストール)
```Shell
wp eval 'exec(file_get_contents("https://raw.githubusercontent.com/ayaoriko/custom-wp-cli-shell/master/ja.sh")." > /dev/null", $output); printf("%s\n", implode("\n", $output));'
```


テーマをアップデート用
```Shell
wp eval 'exec(file_get_contents("https://raw.githubusercontent.com/ayaoriko/custom-wp-cli-shell/master/update.sh")." > /dev/null", $output); printf("%s\n", implode("\n", $output));'
```

WooCommerceのインストール

```Shell
wp --allow-root plugin install woocommerce --activate
```


## 補足
あくまであやおり子が仕事で使うための設定集になりますので、予告なしに中身を変える可能性もございます。予めご了承ください。
