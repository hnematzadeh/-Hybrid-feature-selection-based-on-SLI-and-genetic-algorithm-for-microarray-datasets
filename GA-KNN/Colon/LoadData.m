function data=LoadData()

    load co_data
    load co_lable
    x=co_data';
    t=co_lable';
    data.x=x;
    data.t=t;
    
    data.nx=size(x,1);
    data.nt=size(t,1);
    data.nSample=size(x,2);

end