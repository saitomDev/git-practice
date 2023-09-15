#!/bin/bash

# package.jsonを生成する
npm init --yes

# TypeScriptのインストール
npm install --save-dev typescript @types/node

# tsconfig.jsonを生成する
npx tsc --init

# tsconfig.jsonを更新する
echo '{
  "compilerOptions": {
    "target": "es2020",
    "module": "esnext",
    "moduleResolution": "node",
    "outDir": "./dist",
    "skipLibCheck": true,
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "strict": true
  },
  "include": ["./*.ts"]
}' > tsconfig.json

echo "tsconfig.json が更新されました。"

# Jestをインストールする
npm install --save-dev jest ts-jest @types/jest typescript

# Jestの設定ファイルを作る
npx ts-jest config:init

# rome をインストールする
# https://zenn.dev/kyrice2525/articles/article_tech_009
npm install --save-dev rome 

# rome の設定ファイルを作る 
npx rome init

# javascriptの設定を追加する
echo '{
	"javascript": {
		"formatter": {
		  "quoteStyle": "double",
		  "trailingComma": "all",
		  "semicolons": "always"
		}
	}
}' > rome.json

# .github/workflows/ ディレクトリを作成する
mkdir -p .github/workflows

# ワークフローファイルを生成する
echo 'name: My Workflow
on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout Repository
      uses: actions/checkout@v2

    # ここに他のステップを追加する
' > .github/workflows/main.yml

# 完了メッセージを表示する
echo ".github/workflows/main.yml ファイルが生成されました。"