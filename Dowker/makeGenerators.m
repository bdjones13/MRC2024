function [gens] = makeGenerators(gen_list)
    gens = {}; % empty cell aray
    
    for i = 1:length(gen_list) 
        gen = convertStringsToChars(string(gen_list(i)));
        if i == 1
            gen = gen(4:end);
        elseif i == length(gen_list)
            gen = gen(1:end-1);
        end

        x = split( string(gen), ' + ');

        x(1) = strtrim(x(1));
        x_list = {};
        for j = 1:length(x)
            y = x(j);
            y = y{1};
            if y(1) == '-'
                y = y(2:end);
            end
            y = y(2:end - 1);
            nums = split(y,',');
            x_list{end + 1} = nums;
        end
        gens{end + 1} = x_list;
    end
end
