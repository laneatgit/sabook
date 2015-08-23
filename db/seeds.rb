# encoding: utf-8


def create_subjects(p, children)
  children.each do |i|
    p.children.create!(name:i, subject_type:p.subject_type)
  end
end

Subject.delete_all

########################
# Root Nodes
########################

###??? IMBLANCE

########################
# 資産
########################
root = Subject.create!(name: '資産',  subject_type: 'asset', fixed: true)
current_asset = root.children.create!(name: '流動資産', subject_type: root.subject_type, fixed: true)
current_asset.children.create!(name: '現金',description: '財布の中の現金', subject_type: root.subject_type)
current_asset.children.create!(name: '当座預金',description: '当座預金', subject_type: root.subject_type)
current_asset.children.create!(name: '普通預金',description: '普通預金', subject_type: root.subject_type)
########################
# 純資産
########################
root = Subject.create!(name: '純資産',  subject_type: 'equity', fixed: true)
root.children.create!(name: '開始残高',subject_type: root.subject_type)
########################
# 収益
########################
root = Subject.create!(name: '収益',  subject_type: 'income', fixed: true)
root.children.create!(name: 'その他の収入',subject_type: root.subject_type)
root.children.create!(name: 'ボーナス',subject_type: root.subject_type)
root.children.create!(name: '給与',subject_type: root.subject_type)
root.children.create!(name: '贈与収入',subject_type: root.subject_type)

########################
# 負債
########################
root = Subject.create!(name: '負債',  subject_type: 'liability', fixed: true)
root.children.create!(name: 'クレジットカード',subject_type: root.subject_type)

########################
# 費用
########################
root = Subject.create!(name: '費用',  subject_type: 'expense', fixed: true)
create_subjects(root,['オンラインサービス','クリニング','ケーブルテレビ','コンピューター','その他','衣料品','医療費','義援金','教育','銀行手数料',
'交通機関','購読','趣味','書籍','消耗品','食費','贈答','調整','電話','日用品'])

item = root.children.create!(name: '娯楽',subject_type: root.subject_type)
create_subjects(item,['リクリエーション','音楽/映画','旅行'])

item = root.children.create!(name: '公共料金',subject_type: root.subject_type)
create_subjects(item,['ガス','ゴミ収集','水道','電気'])


item = root.children.create!(name: '自動車',subject_type: root.subject_type)
create_subjects(item,['ガソリン','修理維持','駐車場','通行料'])

item = root.children.create!(name: '税金',subject_type: root.subject_type)
create_subjects(item,['その他の税','健康保険','公的年金','国税','地方税'])

item = root.children.create!(name: '保険料',subject_type: root.subject_type)
create_subjects(item,['医療保険','自動車保険','生命保険'])

########################
# 勘定元帳
########################


EntryItem.delete_all


e = EntryItem.create!(
    entry_date:DateTime.strptime('20150701', '%Y%m%d'), 
    explanation:'go shopping', 
    credit_subject:Subject.find_by(name:'書籍'), 
    debit_subject:Subject.find_by(name:'現金'), 
    amount:32005)


#e = EntryItem.create!(entry_date:DateTime.strptime('20150801', '%Y%m%d'), explanation:'go shopping')
#EntryItemLine.create!(entry_item:e, subject:subject_daily_necessities, direction:'借', amount:1000)
#EntryItemLine.create!(entry_item:e, subject:subject_cash_bag, direction:'貸', amount:1000)
# ledgers/index?subject_id=1　　(お財布)
#       entry_date    explanation     contra_subject  credit_amount   debit_amount
#       2015/8/1,     'go shopping',  日常品,           0                1,000
# ledgers/index?subject_id=2　　(日常品)
#       entry_date    explanation     contra_subject  credit_amount   debit_amount
#       2015/8/1,     'go shopping',  お財布,           1,000             0

#e = EntryItem.create!(entry_date:DateTime.strptime('20150802', '%Y%m%d'), explanation:'bonus')    
#EntryItemLine.create!(entry_item:e, subject:subject_mitsui, direction:'借', amount:100000)
#EntryItemLine.create!(entry_item:e, subject:subject_salary, direction:'貸', amount:100000)

# ledgers/index?subject_id=3　　(三井住友銀行)
#       entry_date    explanation     contra_subject  credit_amount   debit_amount
#       2015/8/2,     'bonus',        給料,           　100,000           0
# ledgers/index?subject_id=4　　(給料)
#       entry_date    explanation     contra_subject  credit_amount   debit_amount
#       2015/8/2,     'bonus',        三井住友銀行,      　0                100,000