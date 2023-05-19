# wp-cli

Local by Flywheel（Local） で新規作成した WordPress サイトを初期化、日本語化するスクリプトです。


## 参考のGit
https://github.com/ko31/init-local-by-flywheel

```Shell
wp eval 'exec(file_get_contents("https://raw.githubusercontent.com/ayaoriko/custom-wp-cli-shell/master/init.sh")." > /dev/null", $output); printf("%s\n", implode("\n", $output));'
```

テーマを作成したあとに実行
```Shell
wp theme activate テーマファイル名
```

テーマをアップデート時に利用
```Shell
wp eval 'exec(file_get_contents("https://raw.githubusercontent.com/ayaoriko/custom-wp-cli-shell/master/update.sh")." > /dev/null", $output); printf("%s\n", implode("\n", $output));'
```

# その他追記
WooCommerceのインストール

```
wp --allow-root plugin install woocommerce --activate
```
