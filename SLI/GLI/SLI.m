clc;
clear;
close all;
load('GLI_85.mat')
GLI_85=GLI_85;

for i=1 :22283
    for j=1 :85
        data(j,i).val=GLI_85(j,i);
        data(j,i).label=GLI_85(j,22284);
        
    end
        f(i).m1=0;
        f(i).m2=0;
        f(i).m3=0;
        f(i).m4=0;
        f(i).m5=0;
end
% %% ordering each col based on theri labels
for i=1 : 22283
    for j=1 : 85
        for k=j+1 :85
            if data(k,i).val<data(j,i).val
                 temp=data(k,i);
                 data(k,i)=data(j,i);
                 data(j,i)=temp;
            end
        end
    end
end


j=1;
for i=1 :22283
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
 
for i=1 : 22283
  if data(1,i).label==2
    for j=1 :85 
        if data(j,i).label==2
            c=c+1;
            if c==26
              jj(i)=j;
%               a(i).zero=jj;
              j=86;
           end
        end
    end
  else
      for s=1 :85 
        if data(s,i).label==1
            c=c+1;
            if c==59
              jj(i)=s;
%               a(i).one=jj;
              s=86;
            end
        end
        
      end
  end
        f(i).m4=85-jj(i);
        c=0;
end
  c0=0;  c1=0;
for i=1 :22283
  if data(1,i).label==2
      for j=2 :85 
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
          if data(j,i).label==2
             f(i).m2=f(i).m2+1;
          end
      end
%       f(i).m2=c0;
%       f(i).m3=c1;
  else
      for j=2 :85 
        if data(j,i).label==2
            cc(i)=j;
           % j=63;
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
for i=1 : 22283
    f(i).m6= (f(i).m2) / (f(i).m2+f(i).m4);
end
for i=1 : 22283
    d(i)= f(i).m6;
end
[value, ind]= sort(d);
% %% constructing new matrix sorted by d
 for i=1 : 22283
     for j=1 :85
         new(j,i)=GLI_85(j,ind(i));
     end
 end
 for j=1  : 85
     new(j,22284)=GLI_85(j,22284);
 end
 
 

      %new2
      for i=1:222
     for j=1:85
         c2(j,i)=new(j,i);
         c2(j,223)=GLI_85(j,22284);
     end
      end
      
      