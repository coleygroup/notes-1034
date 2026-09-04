x = 0.1 * ones(10, 1);
s = my_sum(x);
s_ref = 1;              % known reference value

if s == s_ref
    disp('PASS');
else
    disp('FAIL');
end
