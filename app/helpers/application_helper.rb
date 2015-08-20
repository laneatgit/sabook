module ApplicationHelper

    def trading_title_by_direction(subject_type, opposite_trading_direction)

        if subject_type == '流動資産'
            return opposite_trading_direction=='借' ? '出金' : '入金'
        elsif subject_type == '支出'
            return opposite_trading_direction=='借' ? '割引' : '費用'
        elsif  subject_type == '収入'
            return opposite_trading_direction=='借' ? '収入' : '割引'
        elsif  subject_type == '開始残高'
            return opposite_trading_direction=='借' ? '開始残高' : '割引'
        else
            raise 'wrong in trading_title_by_direction'
        end    

    end

    def display_subject_two_column_headers(subject)
        f = "<th>%s</th><th>%s</th>"
        case subject.subject_type
            when 'asset'
                f % ["増加", "減少"]
            when 'expense'
                f % ["費用", "割引"]
            when 'equity'
                f % ["減少", "増加"]
            when 'income'
                f % ["費用", "収入"]
            when 'liability'
                f % ["減少", "増加"]
            else
                raise 'can not recoginze this subject type'
        end
    end

    def display_subject_amount_in_two_cells(subject, amount, is_credit)
        f = "<td>%s</td><td>%s</td>"
        case subject.subject_type
            when 'asset','expense'
                if is_credit
                    f % ["0", amount] 
                else
                     f % [amount,"0"] 
                end
            when 'equity','income','liability'
                if is_credit
                    f % [amount,"0"] 
                else
                    f % ["0", amount]  
                end
            else
                raise 'can not recoginze this subject type'
        end
    end

end
