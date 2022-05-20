clc;
clear;
close all;
load('SMK_CAN_187.mat')
SMK_CAN_187=SMK_CAN_187;

for i=1 :19993
    for j=1 :187
        data(j,i).val=SMK_CAN_187(j,i);
        data(j,i).label=SMK_CAN_187(j,19994);
        
    end
        f(i).m1=0;
        f(i).m2=0;
        f(i).m3=0;
        f(i).m4=0;
        f(i).m5=0;
end
% %% ordering each col based on theri labels
for i=1 : 19993
    for j=1 : 187
        for k=j+1 :187
            if data(k,i).val<data(j,i).val
                 temp=data(k,i);
                 data(k,i)=data(j,i);
                 data(j,i)=temp;
            end
        end
    end
end


j=1;
for i=1 :19993
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
 
for i=1 : 19993
  if data(1,i).label==0
    for j=1 :187 
        if data(j,i).label==0
            c=c+1;
            if c==97
              jj(i)=j;
%               a(i).zero=jj;
              j=188;
           end
        end
    end
  else
      for s=1 :187 
        if data(s,i).label==1
            c=c+1;
            if c==90
              jj(i)=s;
%               a(i).one=jj;
              s=188;
            end
        end
        
      end
  end
        f(i).m4=187-jj(i);
        c=0;
end
  c0=0;  c1=0;
for i=1 :19993
  if data(1,i).label==0 
      for j=2 :187 
        if data(j,i).label==1
            cc(i)=j;
           % j=63;
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
      for j=2 :187 
        if data(j,i).label==0
            cc(i)=j;
           % j=63;
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
for i=1 : 19993
    f(i).m6= (f(i).m2) / (f(i).m2+f(i).m4);
end
for i=1 : 19993
    d(i)= f(i).m6;
end
[value, ind]= sort(d);
% %% constructing new matrix sorted by d
 for i=1 : 19993
     for j=1 :187
         new(j,i)=SMK_CAN_187(j,ind(i));
     end
 end
 for j=1  : 187
     new(j,19994)=SMK_CAN_187(j,19994);
 end
 

       %new20
      for i=1:200
     for j=1:187
         f2(j,i)=new(j,i);
         f2(j,201)=SMK_CAN_187(j,19994);
     end
      end
