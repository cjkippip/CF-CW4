function XandTarget=k_AR_data(k,num,data)
% construct AR(k) data

XandTarget=ones(num-k,k+1);
XandTarget(:,k+1)=data(k+1:end);

for j=1:k
    for i=1:num-k         
        XandTarget(i,j)=data(i+j-1);  
    end
end





