clc;
clear;
close all;
load('covid2.mat')

for i=1 :15979
    for j=1 :234
        data(j,i).val=t(j,i);
        data(j,i).label=t(j,15980);
        
    end
        f(i).m1=0;
        f(i).m2=0;
        f(i).m3=0;
        f(i).m4=0;
        f(i).m5=0;
end
% %% ordering each col based on theri labels
for i=1 : 15979
    for j=1 : 234
        for k=j+1 :234
            if data(k,i).val<data(j,i).val
                 temp=data(k,i);
                 data(k,i)=data(j,i);
                 data(j,i)=temp;
            end
        end
    end
end


j=1;
for i=1 :15979
    if data(j,i).label==2
        while data(j,i).label==2
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
 
for i=1 : 15979
  if data(1,i).label==2
    for j=1 :234 
        if data(j,i).label==2
            c=c+1;
            if c==93
              jj(i)=j;
%               a(i).zero=jj;
              j=235;
           end
        end
    end
  else
      for s=1 :234 
        if data(s,i).label==1
            c=c+1;
            if c==140
              jj(i)=s;
%               a(i).one=jj;
              s=235;
            end
        end
        
      end
  end
        f(i).m4=234-jj(i);
        c=0;
end
  c0=0;  c1=0;
for i=1 :15979
  if data(1,i).label==2 
      for j=2 :234 
        if data(j,i).label==1
            cc(i)=j;
           % j=235;
           break;
        end
      end
      for j=cc(i) : jj(i)
          if data(j,i).label==1
             f(i).m3=f(i).m3+1;
          end
          if data(j,i).label==2
             f(i).m2=f(i).m2+1;
          end
      end
%       f(i).m2=c0;
%       f(i).m3=c1;
  else
      for j=2 :234 
        if data(j,i).label==2
            cc(i)=j;
           % j=235;
           break;
        end
      end
      for j=cc(i) : jj(i)
          if data(j,i).label==1
             f(i).m2=f(i).m2+1;
          end
          if data(j,i).label==2
             f(i).m3=f(i).m3+1;
          end
      end
%       f(i).m2=c1;
%       f(i).m3=c0;
 end
   c0=0; c1=0;
end
for i=1 : 15979
    f(i).m6= (f(i).m2) / (f(i).m2+f(i).m4);
end
for i=1 : 15979
    d(i)= f(i).m6;
end
[value, ind]= sort(d);
% %% constructing new matrix sorted by d
 for i=1 : 15979
     for j=1 :234
         new(j,i)=t(j,ind(i));
     end
 end
 for j=1  : 234
     new(j,15980)=t(j,15980);
 end
 

       %new20
      for i=1:160
     for j=1:234
         f2(j,i)=new(j,i);
         f2(j,161)=t(j,15980);
     end
      end
