---
description: リリースPRから自分のPRを抽出して一覧表示[/extract-my-prs-from-release PR番号orURL [ユーザー名]]
arguments:
  - name: pr
    description: リリースPRの番号またはURL（必須）
    required: true
  - name: username
    description: 抽出対象のGitHubユーザー名（デフォルト: @me）
    required: false
---

## Your task

リリースPRのbodyから指定ユーザーのPRを抽出し、一覧表示する。

## Steps

1. PR情報を取得:
   - PR番号の場合: `gh pr view {pr_number} --json body`
   - URLの場合: URLからPR番号を抽出して同様に取得

2. bodyから指定ユーザー（デフォルト: 実行者自身）のPRを抽出:
   - パターン: `[タイトル](URL) by @{username}`

3. 結果を以下の形式で出力（ターミナルでリンクが有効になるようURLは生のまま表示）:

{username} の PR（X件）:

- {タイトル} #番号 URL
- {タイトル} #番号 URL
...

## Constraints

- 第1引数（PR番号またはURL）は必須
- 第2引数がない場合は `@me`（実行者自身）として扱う
- PRが0件の場合は「該当ユーザーのPRはありません」と表示
- URLからPR番号を抽出する際は末尾の数字部分を使用
