for i=1:695
for j=1:7
train(i,j) = GarbageWeight(i,j);
end
end

for i=696:772
for j=1:6
test(i-695,j) = GarbageWeight(i,j);
end
end

for i=696:772
label_test(i-695,1) = GarbageWeight(i,7);
end
label_test_array = table2array(label_test);

mdl1 = fitlm(train);

mse = mean(label_test_array - predict(mdl1,test)).^2

sum=0;
garbageweight = table2array(GarbageWeight(:,7));
for i=1:772
sum=sum+garbageweight(i,1);
end
mean=sum/772