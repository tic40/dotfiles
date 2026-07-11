---
name: trello-today-todo
description: TODOボードの「🏃今週やること」リストから JST 今日の「TODO YYYY/MM/DD」カードを探し、その TODO チェックリストをチェックボックス付きで表示する。URL 指定は不要[/trello-today-todo]
arguments:
  - name: date
    description: 対象日（YYYY/MM/DD または YYYY-MM-DD）。省略時は JST の今日
    required: false
---

## Your task

TODOボードの「🏃今週やること」リストから、対象日（既定は JST 今日）の日次 TODO カード「`TODO YYYY/MM/DD`」を特定し、そのカードの **TODO** チェックリストを完了/未完了つきで整形して表示する。URL を渡してもらう必要はない。

## Steps

1. 対象日を決める。引数があればそれを、無ければ **JST の今日**を使う。カード名の照合キーはスラッシュ区切りの `TODO YYYY/MM/DD`（例: `TODO 2026/07/11`）。JST 日付が曖昧なら `TZ=Asia/Tokyo date '+%Y/%m/%d'` で取得してよい。

2. `🏃今週やること` リストのカード一覧を取得する。`mcp__trello__get_cards_by_list_id` を次の既知 ID で呼ぶ:
   - `boardId`: `5d5773cef8628288b4e27e35`（TODOボード）
   - `listId`: `5e0202919641cc8a54386aa4`（🏃今週やること）
   - ID がエラーになる／変わっている場合のフォールバック: `mcp__trello__list_boards` → 「TODOボード」を特定 → `mcp__trello__get_lists` で「🏃今週やること」の `listId` を得てから再取得。

3. 取得したカードから `name` が対象日の `TODO YYYY/MM/DD` に一致するものを探す。
   - 見つからなければ「{対象日} の TODO カードが見つかりませんでした（🏃今週やること リスト内）」と表示して停止。

4. そのカードの `id` で `mcp__trello__get_card` を `{ "cardId": "<id>" }` で呼び、`checklists[]` から **`name == "TODO"`** のチェックリストを取り出す。
   - `TODO` という名前のチェックリストが無い場合は、そのカードの全チェックリストを対象にする。

5. 結果をコンソールにそのまま Markdown で出力（コードブロックで囲まない）。カード名と完了数を見出しに:

   カード「{カード名}」の TODO（{完了数}/{総数} 完了）

   - [x] 完了した項目
   - [ ] 未完了の項目

   - `checkItems` は `pos` 昇順で並べる（Trello 表示順に合わせる）
   - `state == complete` は `- [x]`、それ以外は `- [ ]`

## Constraints

- 認証は user スコープの MCP サーバー `trello`（`TRELLO_API_KEY` / `TRELLO_TOKEN` を `~/.zshrc.local` の env から読む）。`mcp__trello__*` ツールが見つからない場合は「trello MCP が未接続。新しいシェルで claude を起動し直して `/mcp` で確認」と案内して停止する。
- 取得のみ。チェック状態の変更・項目追加などの書き込みは行わない（頼まれたら別途）。
- ルーティン等の他チェックリストも見たい場合は `/trello-checklist <card-url>` を案内する。
