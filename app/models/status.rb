class Status < ActiveHash::Base
    self.data = [
        {id: 1, name: '未対応'},{id: 2, name: '対応中'},{id:3, name: '完了'}
    ]
end