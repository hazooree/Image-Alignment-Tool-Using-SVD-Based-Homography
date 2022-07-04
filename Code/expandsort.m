function [ MATR ] = expandsort( MAT,col )
% function [ MATR ] = expandsort( MAT,col )
% (Copyright) Hazoor Ahmad
% PhD Fellow
% ITU, Lahore, Pakistan.

sizx = size(MAT,1);
if col==1
    for i =1 : sizx-1
        for j = 1 : sizx-1
            if (MAT(j,col)>MAT(j+1,col))
                temp2=MAT(j,col);
                temp3=MAT(j,(col+1):end);
                MAT(j,col)=MAT(j+1,col);
                MAT(j,(col+1):end)=MAT(j+1,(col+1):end);
                MAT(j+1,col)=temp2;
                MAT(j+1,(col+1):end)=temp3;
            end
        end
    end
else
    for i =1 : sizx-1
        for j = 1 : sizx-1
            if (MAT(j,col)>MAT(j+1,col))
                temp1=MAT(j,1:(col-1));
                temp2=MAT(j,col);
                temp3=MAT(j,(col+1):end);
                MAT(j,1:(col-1))=MAT(j+1,1:(col-1));
                MAT(j,col)=MAT(j+1,col);
                MAT(j,(col+1):end)=MAT(j+1,(col+1):end);
                MAT(j+1,1:(col-1))=temp1;
                MAT(j+1,col)=temp2;
                MAT(j+1,(col+1):end)=temp3;
            end
        end
    end
end
MATR=MAT;
end
