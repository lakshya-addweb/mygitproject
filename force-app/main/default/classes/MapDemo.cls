public class MapDemo {
    public static void demo(){
        Map<Integer, String>colors = new Map<Integer, String>();
        Map<Integer, String>newcolors = new Map<Integer, String>();
        
        colors.put(1,'abc');
        colors.put(2,'bcd');
        system.debug('colors'+colors);
        newcolors.put(1,'blue');
        system.debug('colors'+newcolors);
        colors.putAll(newcolors);
        system.debug('Mapped colors'+colors);
        
    }
}