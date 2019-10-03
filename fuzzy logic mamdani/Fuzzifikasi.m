%aditive sum dan probabilistik
function [fuzzy] = Fuzzifikasi(crispX, maxX, minX, pilih)
    switch pilih
        case 'function_1'%turun
            fuzzy = (maxX-crispX)/(maxX-minX)/2;
        case 'function_2'%naik
            fuzzy = (crispX-minX)/(maxX-minX)^2;  
        case 'function_3'%turunS       
            fuzzy = 2*((maxX-crispX)/(maxX-minX))/2;
        case 'function_4'%naikS
            fuzzy = 1-2*((maxX-crispX)/(maxX-minX));
        otherwise
            fuzzy = 0.0;
    end
end
