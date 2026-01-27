---
description: 自分のマージ済みPRをサマリー表示[/my-merged-prs 期間]
arguments:
  - name: period
    description: 期間指定（yesterday, week, month）デフォルトはweek
    required: false
---

## Your task

指定された期間内にマージされた自分のPRを取得し、整形してサマリーを表示する。

## Steps

1. 以下のコマンドでマージ済みPRを取得:
   - yesterday: `gh pr list --author @me --state merged --search "merged:>=$(date -v-1d +%Y-%m-%d)" --json number,title,url,mergedAt`
   - week: `gh pr list --author @me --state merged --search "merged:>=$(date -v-7d +%Y-%m-%d)" --json number,title,url,mergedAt`
   - month: `gh pr list --author @me --state merged --search "merged:>=$(date -v-30d +%Y-%m-%d)" --json number,title,url,mergedAt`

2. 結果を以下の形式で表示:

```
## マージ済みPR一覧（{期間}）

| # | タイトル | マージ日 |
|---|----------|----------|
| #123 | PR title here | 2024-01-15 |
...

## サマリー

- 合計: X件
- カテゴリ別:
  - feat: X件
  - fix: X件
  - refactor: X件
  - その他: X件
```

3. PRタイトルのプレフィックス（feat:, fix:, refactor:, chore:, docs:, test:）を分析してカテゴリ別に集計

## Constraints

- 引数がない場合は week として扱う
- PRが0件の場合は「該当期間にマージ済みPRはありません」と表示
