clear;
importdata;
output_str = '$$\n\\begin{array}[b] {|';
% find how may fields;
num_fields = size(input,2)-1;
for i = 1:num_fields
    str_col = "c|";
    output_str = output_str + str_col;
end
output_str = output_str + "}\n";
% find how many lines;
num_lines = size(input,1);
for i = 1:num_lines
    if i == 2
        continue;
    end
    output_str = output_str + "\\hline ";
    str_line = input(i,:);
    for id_field = 1:num_fields
        str_filed = str_line(id_field+1);
        if (id_field == 1)
            output_str = output_str + str_filed;            
        else
            output_str = output_str + "&" + str_filed;
        end
    end
    output_str = output_str + "\\\\" + "\n";
end
% end string;
output_str = output_str + "\\hline \n" + "\\end{array}\n" + "$$";


% write to files
file_handle = fopen('output.txt','w');
fprintf(file_handle, output_str);
%fprintf(file_handle, "%s", output_str);
fclose(file_handle);

