package com;

public class Order {
    public int Oid;
    public int Cid;
    public int Mnum;
    public int Oprice;
    public int Odiscount;
    public String Ofinish;
    public Order(int oid,int cid,int mnum,int oprice, int odiscount, String ofinish)
    {
        Oid=oid;
        Cid=cid;
        Mnum=mnum;
        Oprice=oprice;
        Odiscount=odiscount;
        Ofinish=ofinish;
    }
}
