nbr_state = 3;
total_time = 5;
trellis = 10*ones(nbr_state,total_time);
trellis(1,:) = 2;
trellis(3,:) = 1;
t =1;
p = PriorityQueue(true);
sparse_trellis_accum = containers.Map('KeyType','double','ValueType','double');

insert(p,2,sub2ind([nbr_state,total_time],1,t)); 
insert(p,10,sub2ind([nbr_state,total_time],2,t));
insert(p,1,sub2ind([nbr_state,total_time],3,t));

[score,idx] = pop(p);
sparse_trellis_accum(idx) = score;
[~,t1] = ind2sub([nbr_state,total_time],idx);
insert(p,score+2,sub2ind([nbr_state,total_time],1,t1+1)); 
insert(p,score+10,sub2ind([nbr_state,total_time],2,t1+1));
insert(p,score+1,sub2ind([nbr_state,total_time],3,t1+1));
    
while true
    [score,idx] = pop(p);
    while (isKey(sparse_trellis_accum,idx))
        [score,idx] = pop(p);
    end
    sparse_trellis_accum(idx) = score;
    [~,t1] = ind2sub([nbr_state,total_time],idx);
    if (t1 == total_time)
        break;
    end
    insert(p,score + 2,sub2ind([nbr_state,total_time],1,t1+1)); 
    insert(p,score + 10,sub2ind([nbr_state,total_time],2,t1+1));
    insert(p,score + 1,sub2ind([nbr_state,total_time],3,t1+1));
end


sparseIndicesCell = keys(sparse_trellis_accum);
sparseIndices = cell2mat(sparseIndicesCell);
[r,c] = ind2sub([nbr_state,total_time],sparseIndices);
scores = cell2mat(values(sparse_trellis_accum,sparseIndicesCell)); 
sparse_trellis_matrix = sparse(r,c,scores);
figure,
spy(trellis);
[r1,c1] = ind2sub([nbr_state,total_time],1:nbr_state*total_time);
hold on, text(c1,r1,num2str(trellis(:)));
disp('press any key')
pause
hold on, spy(sparse_trellis_matrix,'r');
hold on, text(c,r+0.2,num2str(scores(:)),'FontSize',18);

title('visited nodes (red)')