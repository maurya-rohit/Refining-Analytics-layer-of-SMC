for i=1:620
for j=1:7
train(i,j) = FinalData4monthsdateclass(i,j);
end
end

for i=621:777
for j=1:6
test(i-620,j) = FinalData4monthsdateclass(i,j);
end
end

for i=621:777
label_test(i-620,1) = FinalData4monthsdateclass(i,7);
end
label_test_array = table2array(label_test);

mdl1 = fitlm(train);

mse = mean(label_test_array - predict(mdl1,test)).^2