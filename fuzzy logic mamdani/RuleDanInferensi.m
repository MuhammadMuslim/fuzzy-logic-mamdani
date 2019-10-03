function [crispX, fuzzyX] = RuleDanInferensi(fuzzyTemp1, fuzzyTemp2, minX, maxX, pilih, operatorX)
    if (fuzzyTemp1 > 0) && (fuzzyTemp2 > 0)
        switch operatorX
            case 'AND'
                if fuzzyTemp1 < fuzzyTemp2
                    fuzzyX = fuzzyTemp1;
                else
                    fuzzyX = fuzzyTemp2;
                end
            case 'OR'
                if fuzzyTemp1 > fuzzyTemp2
                    fuzzyX = fuzzyTemp1;
                else
                    fuzzyX = fuzzyTemp2;
                end
        end   
        
        switch pilih
            case 'turun'
                crispX = minX-((maxX-minX)*fuzzyX); % fuzzyX=(Max-crispX)/(Max-Min)
            case 'naik'
                crispX = maxX+((maxX+minX)*fuzzyX); % fuzzyX=(crispX-Min)/(Max-Min)
        end
    else
        fuzzyX = 0.0;
        crispX = 0;
    end
end
