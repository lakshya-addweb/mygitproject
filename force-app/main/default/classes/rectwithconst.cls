public class rectwithconst {
    decimal length;
    decimal breadth;
    public rectwithconst(decimal l , decimal b  ){
        length = l;
        breadth = b;
    }
    public void area(){
        decimal area= length * breadth;
        System.debug('Area = '+ area);
    }
}