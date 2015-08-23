module ApplicationHelper

    
    

    def subject_title_in_entry(subject_type, options = {})

        options = {is_credit:false}.merge(options)
        is_credit = options[:is_credit]
        case subject_type
            when 'asset'
                is_credit ? '入金' : '出金'
            when 'expense'
                is_credit ? '費用' : '割引'
            when 'equity'
                is_credit ? '減少' : '増加'
            when 'income'
                is_credit ? '費用' : '収入'
            when 'liability'
                is_credit ? '減少' : '増加'
            else
                raise 'can not recoginze this subject type'
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
