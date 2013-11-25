function [supp,score] = supporters(node)
switch node
    case 1
        supp = [2,3];
        score = [5,3];
    case 2
        supp = [4,5];
        score = [5,3];
    case 3
        supp = [4,5];
        score = [5,3];
    case 4
        supp = [6,7];
        score = [5,3];
    case 5
        supp = [6,7];
        score = [5,3];
    case 6
        supp = [];
        score = [0,0];
    case 7
        supp = [];
        score = [0,0];
end
