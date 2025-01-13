public class rectangle {
    public void area(){
        Decimal len= 5.6,bre=4.4;
        Decimal area= len* bre;
        System.debug('Area='+area);
    }
    public void perimeter(){
        Decimal len= 5.6,bre=4.4;
        Decimal peri= 2*(len+bre);
        System.debug('Perimeter'+peri);
    }
}