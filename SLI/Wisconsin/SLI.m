clc;
clear;
close all;
load('wisconsin.mat')
wisconsin=wisconsin;

for i=1 :33
    for j=1 :194
        data(j,i).val=wisconsin(j,i);
        data(j,i).label=wisconsin(j,34);
        
    end
        f(i).m1=0;
        f(i).m2=0;
        f(i).m3=0;
        f(i).m4=0;
        f(i).m5=0;
end
% %% ordering each col based on theri labels
for i=1 : 33
    for j=1 : 194
        for k=j+1 :194
            if data(k,i).val<data(j,i).val
                 temp=data(k,i);
                 data(k,i)=data(j,i);
                 data(j,i)=temp;
            end
        end
    end
end


j=1;
for i=1 :33
    if data(j,i).label==-1
        while data(j,i).label==-1
           f(i).m1=f(i).m1+1;
           j=j+1;
        end
    else
        while data(j,i).label==1
            f(i).m1=f(i).m1+1;
            j=j+1;
        end
    end
    j=1;
end
 c=0;
 
for i=1 : 33
  if data(1,i).label==-1
    for j=1 :194 
        if data(j,i).label==-1
            c=c+1;
            if c==40
              jj(i)=j;
%               a(i).zero=jj;
              j=195;
           end
        end
    end
  else
      for s=1 :194 
        if data(s,i).label==1
            c=c+1;
            if c==22
              jj(i)=s;
%               a(i).one=jj;
              s=195;
            end
        end
        
      end
  end
        f(i).m4=194-jj(i);
        c=0;
end
  c0=0;  c1=0;
for i=1 :33
  if data(1,i).label==-1 
      for j=2 :194 
        if data(j,i).label==1
            cc(i)=j;
           % j=195;
           break;
        end
      end
      for j=cc(i) : jj(i)
          if data(j,i).label==1
             f(i).m3=f(i).m3+1;
          end
          if data(j,i).label==-1
             f(i).m2=f(i).m2+1;
          end
      end
%       f(i).m2=c0;
%       f(i).m3=c1;
  else
      for j=2 :194 
        if data(j,i).label==-1
            cc(i)=j;
           % j=195;
           break;
        end
      end
      for j=cc(i) : jj(i)
          if data(j,i).label==1
             f(i).m2=f(i).m2+1;
          end
          if data(j,i).label==-1
             f(i).m3=f(i).m3+1;
          end
      end
%       f(i).m2=c1;
%       f(i).m3=c0;
 end
   c0=0; c1=0;
end
for i=1 : 33
    f(i).m6= (f(i).m2) / (f(i).m2+f(i).m4);
end
for i=1 : 33
    d(i)= f(i).m6;
end
[value, ind]= sort(d);
% %% constructing new matrix sorted by d
 for i=1 : 33
     for j=1 :194
         new(j,i)=wisconsin(j,ind(i));
     end
 end
 for j=1  : 194
     new(j,34)=wisconsin(j,34);
 end
 
 

      %new2
      for i=1:2
     for j=1:194
        f2(j,i)=new(j,i);
         f2(j,3)=wisconsin(j,34);
     end
      end
      
     