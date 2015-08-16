module ApplicationHelper

    def trading_title_by_direction(subject_type, opposite_trading_direction)

        if subject_type == '流動資産'
            return opposite_trading_direction=='借' ? '出金' : '入金'
        elsif subject_type == '支出'
            return opposite_trading_direction=='借' ? '割引' : '費用'
        elsif  subject_type == '収入'
            return opposite_trading_direction=='借' ? '収入' : '割引'
        else
            raise 'wrong in trading_title_by_direction'
        end    

    end

end
