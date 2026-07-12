---
name: trello-checklist
description: Trello カードの URL / 短縮リンク / ID を渡すと、そのカードのチェックリストをチェックボックス付きで一覧表示する[/trello-checklist <card-url>]
arguments:
  - name: card
    description: Trello カードの URL（https://trello.com/c/XXXXXXXX/...）、短縮リンク（XXXXXXXX）、または 24 桁のカード ID
    required: true
---

## Your task

渡された Trello カードを特定し、そのカードに紐づく全チェックリストを、項目の完了/未完了つきで整形して表示する。

## Steps

1. 引数からカード識別子を取り出す。`get_card` の `cardId` にはどれもそのまま渡せる:
   - URL `https://trello.com/c/1yJ2AtZo/13815-todo-...` → `/c/` の直後のセグメント `1yJ2AtZo`（短縮リンク）
   - 短縮リンクのみ `1yJ2AtZo` → そのまま
   - 24 桁の 16 進 ID → そのまま
   - 引数が無ければ、カードの URL を尋ねて停止（勝手に推測しない）

2. `mcp__trello__get_card` を `{ "cardId": "<識別子>" }` で呼ぶ。レスポンスの `checklists[]` に各チェックリスト（`name` と `checkItems[]`）が入る。`checkItems[].state` は `complete` / `incomplete`。

3. 結果をコンソールにそのまま Markdown で出力（コードブロックで囲まない）。カード名と全体の完了数を見出しに、チェックリストごとにセクション化する:

   カード「{カード名}」のチェックリスト（{完了数}/{総数} 完了）

   ## {チェックリスト名}（{完了数}/{総数} 完了）
   - [x] 完了した項目
   - [ ] 未完了の項目

   - `checkItems` は `pos` 昇順で並べる（Trello 表示順に合わせる）
   - `state == complete` は `- [x]`、それ以外は `- [ ]`

## Constraints

- 認証は user スコープの MCP サーバー `trello`（`TRELLO_API_KEY` / `TRELLO_TOKEN` を `~/.zshrc.local` の env から読む）。`mcp__trello__*` ツールが見つからない場合は「trello MCP が未接続。新しいシェルで claude を起動し直して `/mcp` で確認」と案内して停止する。
- チェックリストが 1 つも無いカードなら「このカードにチェックリストはありません」と表示。
- 取得のみ。チェック状態の変更・項目追加などの書き込みは行わない（頼まれたら別途）。
