function result = convertClasses(Y)
    if isa(Y(1),"cell")
        tmp_Y = zeros(length(Y),1);
        for i=(1:length(Y))
            if Y(i)=="normal"
                tmp_Y(i) = 0;
            else
                tmp_Y(i) = 1;
            end
        end
    else
        tmp_Y = strings(length(Y),1);
        for i=(1:length(Y))
            if Y(i) == 0
                tmp_Y(i) = "normal";
            else
                tmp_Y(i) = "tumor";
            end
        end
    end
    result = tmp_Y;
end