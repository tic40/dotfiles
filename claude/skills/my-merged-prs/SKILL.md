---
name: my-merged-prs
description: 自分が作成者または Assignee のマージ済みPRをサマリー表示[/my-merged-prs 期間]
arguments:
  - name: period
    description: 期間指定（yesterday, week, month）デフォルトはweek
    required: false
---

## Your task

指定された期間内にマージされた、自分が作成者または Assignee に含まれるPRを取得し、整形してサマリーを表示する。

## Steps

1. 期間から開始日 `SINCE` を決め、作成者と Assignee の2通りでマージ済みPRを取得する（`--limit` でデフォルト30件の上限を引き上げ、件数の取りこぼしを防ぐ）:
   - `SINCE`: yesterday は `$(date -v-1d +%Y-%m-%d)`、week は `$(date -v-7d +%Y-%m-%d)`、month は `$(date -v-30d +%Y-%m-%d)`
   - 作成者: `gh pr list --author @me --state merged --limit 200 --search "merged:>=$SINCE" --json number,title,url,mergedAt,body`
   - Assignee: `gh pr list --assignee @me --state merged --limit 200 --search "merged:>=$SINCE" --json number,title,url,mergedAt,body`
   - 2つの結果を PR 番号で重複排除してマージする
   - どちらかの取得件数が `--limit` に達した場合は上限到達の可能性をユーザーに伝える

2. PRタイトルのプレフィックス（feat:, fix:, refactor:, chore:, docs:, test:）を分析してカテゴリ別に分類

3. 結果をコンソールにそのままMarkdown形式で出力（コードブロックで囲まない）:

## マージ済みPR（{期間}）

### feat (X件)

| タイトル | Link | マージ日 | 概要 |
|----------|------|----------|------|
| feat: add new feature | [#123](url) | 2024-01-15 | 新機能の追加... |

### fix (X件)

| タイトル | Link | マージ日 | 概要 |
|----------|------|----------|------|
| fix: resolve bug | [#124](url) | 2024-01-14 | バグ修正... |

### その他 (X件)

| タイトル | Link | マージ日 | 概要 |
|----------|------|----------|------|
...

---
合計: X件

4. 概要はPR bodyの先頭100文字程度を抽出（改行は除去、テーブルが崩れないよう`|`は除去）

## Constraints

- 引数がない場合は week として扱う
- PRが0件の場合は「該当期間にマージ済みPRはありません」と表示
