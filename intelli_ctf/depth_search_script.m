trellis(1) = struct('ub',0,'lb',0,'state','unvisited','supporters',[2,3]);
trellis(2) = struct('ub',0,'lb',0,'state','unvisited','supporters',[4,5]);
trellis(3) = struct('ub',0,'lb',0,'state','unvisited','supporters',[4,5]);
trellis(4) = struct('ub',0,'lb',0,'state','unvisited','supporters',[6,7]);
trellis(5) = struct('ub',0,'lb',0,'state','unvisited','supporters',[6,7]);
trellis(6) = struct('ub',0,'lb',0,'state','unvisited','supporters',[8,9]);
trellis(7) = struct('ub',0,'lb',0,'state','unvisited','supporters',[8,9]);
trellis(8) = struct('ub',0,'lb',0,'state','unvisited','supporters',[]);
trellis(9) = struct('ub',0,'lb',0,'state','unvisited','supporters',[]);

acc_score = depth_search(trellis,1);