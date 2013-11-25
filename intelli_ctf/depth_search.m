function acc_score = depth_search(trellis,root)
fprintf(2,'processing node %d\n',root);
if isempty(trellis(root).supporters)
    acc_score = 0;
    return
else
    if strcmp(trellis(root).state,'visited')
        acc_score = trellis(root).ub;
        fprintf('saving time\n')
    else
        [a,scores] = supporters(root);
        score1 = depth_search(trellis,a(1));
        score2 = depth_search(trellis,a(2));
        acc_score = max(score1+scores(1),score2+scores(2));
        fprintf(2,'finished processing node %d, score = %f\n',root,acc_score);
        trellis(root).state = 'visited';
        trellis(root).ub = acc_score;
    end
end