function data=LoadData()

    load cns_data
    load cns_lable
    x=cns_data';
    t=cns_lable';
    data.x=x;
    data.t=t;
    
    data.nx=size(x,1);
    data.nt=size(t,1);
    data.nSample=size(x,2);

end