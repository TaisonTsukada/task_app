# タスク管理アプリ

## 要件
- タスクを新規登録することができる。この時のステータスは「未対応」「対応中」の２つにすること。
- 自分のタスクであればタスクを編集することができる。ただし担当者の編集はできないようにすること。
- 自分のタスクであれば、タスクのアサイン画面で担当者を変更することができる。
- 自分のタスクであればタスクを削除することができる。
- タスク一覧画面がある。ここにはステータスが「未対応」「対応中」のタスクが表示される。期限が過ぎているタスクと過ぎていないタスクが区別できるようにすること。
- マイタスク画面がある。ここには担当者が自分かつステータスが「未対応」「対応中」のタスクが表示される。期限が過ぎているタスクと過ぎていないタスクが区別できるようにすること。
- Bootstrapを用いて画面をレスポンシブ対応させる。
- メール認証付きのログイン機能がある。
- コーディング規約 に基づいて開発できている。
- アプリケーションを日本語化設定する。
- 画面設計通りにデザインをする。

## テーブル設計
`usersテーブル`
- Deviseデフォルトのカラム
- 名前(name)
`tasksテーブル`
- タイトル(title)
- 内容(content)
- 期限(deadline)
- 担当者(user_id)
- ステータス(status)

## 画面設計

`ログイン`
<img width="1365" alt="ログイン" src="https://user-images.githubusercontent.com/78004609/121285710-cb78f780-c919-11eb-8fda-84fc28f8e092.png">

`サインアップ`
![サインアップ](https://user-images.githubusercontent.com/78004609/121285867-0549fe00-c91a-11eb-9a12-085fe253a28a.png)

`ユーザー編集`
![ユーザー編集画面](https://user-images.githubusercontent.com/78004609/121286069-49d59980-c91a-11eb-8832-9f77ae800494.png)

`タスク一覧`
![タスク一覧](https://user-images.githubusercontent.com/78004609/121286259-8acdae00-c91a-11eb-8c87-c7c1af8f0a9e.png)

`マイタスク一覧`
<img width="1438" alt="マイタスク" src="https://user-images.githubusercontent.com/78004609/121286391-b8b2f280-c91a-11eb-8e6c-d5576985e821.png">

`タスク詳細`
<img width="1438" alt="タスク詳細" src="https://user-images.githubusercontent.com/78004609/121286475-db450b80-c91a-11eb-8d98-7758555ac6e4.png">

`タスク新規`
<img width="1438" alt="タスク新規" src="https://user-images.githubusercontent.com/78004609/121286582-fca5f780-c91a-11eb-968b-111150f96821.png">

`タスク編集`
<img width="1438" alt="タスク編集" src="https://user-images.githubusercontent.com/78004609/121286711-30811d00-c91b-11eb-908b-ee2563664ef4.png">

`タスクアサイン`
<img width="1438" alt="タスクアサイン" src="https://user-images.githubusercontent.com/78004609/121286790-4b539180-c91b-11eb-813d-7143d61ed8f3.png">