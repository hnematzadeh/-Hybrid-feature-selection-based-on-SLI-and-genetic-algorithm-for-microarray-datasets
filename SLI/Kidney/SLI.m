clc;
clear;
close all;
load('ckd.mat')
ckd=ckd;

for i=1 :28
    for j=1 :200
        data(j,i).val=ckd(j,i);
        data(j,i).label=ckd(j,29);
        
    end
        f(i).m1=0;
        f(i).m2=0;
        f(i).m3=0;
        f(i).m4=0;
        f(i).m5=0;
end
% %% ordering each col based on theri labels
for i=1 : 28
    for j=1 : 200
        for k=j+1 :200
            if data(k,i).val<data(j,i).val
                 temp=data(k,i);
                 data(k,i)=data(j,i);
                 data(j,i)=temp;
            end
        end
    end
end


j=1;
for i=1 :28
    if data(j,i).label==0
        while data(j,i).label==0
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
 
for i=1 : 28
  if data(1,i).label==0
    for j=1 :200 
        if data(j,i).label==0
            c=c+1;
            if c==72
              jj(i)=j;
%               a(i).zero=jj;
              j=201;
           end
        end
    end
  else
      for s=1 :200 
        if data(s,i).label==1
            c=c+1;
            if c==128
              jj(i)=s;
%               a(i).one=jj;
              s=201;
            end
        end
        
      end
  end
        f(i).m4=200-jj(i);
        c=0;
end
  c0=0;  c1=0;
for i=1 :28
  if data(1,i).label==0 
      for j=2 :200 
        if data(j,i).label==1
            cc(i)=j;
           % j=201;
           break;
        end
      end
      for j=cc(i) : jj(i)
          if data(j,i).label==1
             f(i).m3=f(i).m3+1;
          end
          if data(j,i).label==0
             f(i).m2=f(i).m2+1;
          end
      end
%       f(i).m2=c0;
%       f(i).m3=c1;
  else
      for j=2 :200 
        if data(j,i).label==0
            cc(i)=j;
           % j=201;
           break;
        end
      end
      for j=cc(i) : jj(i)
          if data(j,i).label==1
             f(i).m2=f(i).m2+1;
          end
          if data(j,i).label==0
             f(i).m3=f(i).m3+1;
          end
      end
%       f(i).m2=c1;
%       f(i).m3=c0;
 end
   c0=0; c1=0;
end
for i=1 : 28
    f(i).m6= (f(i).m2) / (f(i).m2+f(i).m4);
end
for i=1 : 28
    d(i)= f(i).m6;
end
[value, ind]= sort(d);
% %% constructing new matrix sorted by d
 for i=1 : 28
     for j=1 :200
         new(j,i)=ckd(j,ind(i));
     end
 end
 for j=1  : 200
     new(j,29)=ckd(j,29);
 end
 

      %new2
      for i=1:2
     for j=1:200
         f2(j,i)=new(j,i);
         f2(j,3)=ckd(j,29);
     end
      end
